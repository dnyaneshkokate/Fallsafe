// FallSafe - ported from ESP32 (BluetoothSerial) to Seeed XIAO ESP32C3 (BLE)

#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>
#include "MAX30105.h"
#include "heartRate.h"

// ---- Pin assignments (XIAO ESP32C3) ----
#define I2C_SDA_PIN   6
#define I2C_SCL_PIN   7
#define STATUS_LED_PIN 10

// ---- BLE "serial" service ----
#define SERVICE_UUID           "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"
#define CHARACTERISTIC_UUID_TX "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"
#define CHARACTERISTIC_UUID_RX "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"

String device_name = "FallSafe";

BLEServer *pServer = nullptr;
BLECharacteristic *pTxCharacteristic = nullptr;
bool deviceConnected = false;

Adafruit_MPU6050 mpu;

float prevAccX = 0;
float prevAccY = 0;
float prevAccZ = 0;

// ADDED: actual time of previous reading
unsigned long previousTime = 0;

MAX30105 particleSensor;
TaskHandle_t heartTask;

const byte RATE_SIZE = 4;
byte rates[RATE_SIZE];
byte rateSpot = 0;
long lastBeat = 0;

float beatsPerMinute;
int beatAvg;

// ---- BLE connection callbacks ----
class MyServerCallbacks : public BLEServerCallbacks {
  void onConnect(BLEServer *server) override {
    deviceConnected = true;
  }

  void onDisconnect(BLEServer *server) override {
    deviceConnected = false;
    server->getAdvertising()->start();
  }
};

// Helper to send over BLE
void bleSend(const String &msg) {
  if (deviceConnected && pTxCharacteristic) {
    pTxCharacteristic->setValue(msg.c_str());
    pTxCharacteristic->notify();
  }
}

void handleHeart(void *pvParameters) {
  while (true) {
    long irValue = particleSensor.getIR();

    if (checkForBeat(irValue) == true) {
      long delta = millis() - lastBeat;
      lastBeat = millis();

      beatsPerMinute = 60 / (delta / 1000.0);

      if (beatsPerMinute < 255 && beatsPerMinute > 20) {
        rates[rateSpot++] = (byte)beatsPerMinute;
        rateSpot %= RATE_SIZE;

        beatAvg = 0;
        for (byte x = 0; x < RATE_SIZE; x++)
          beatAvg += rates[x];

        beatAvg /= RATE_SIZE;
      }
    }

    vTaskDelay(pdMS_TO_TICKS(5));
  }
}

void setup(void) {

  Serial.begin(115200);
  pinMode(STATUS_LED_PIN, OUTPUT);

  while (!Serial)
    delay(10);

  // ---- BLE init ----
  BLEDevice::init(device_name.c_str());

  pServer = BLEDevice::createServer();
  pServer->setCallbacks(new MyServerCallbacks());

  BLEService *pService = pServer->createService(SERVICE_UUID);

  pTxCharacteristic = pService->createCharacteristic(
      CHARACTERISTIC_UUID_TX,
      BLECharacteristic::PROPERTY_NOTIFY);

  pTxCharacteristic->addDescriptor(new BLE2902());

  BLECharacteristic *pRxCharacteristic = pService->createCharacteristic(
      CHARACTERISTIC_UUID_RX,
      BLECharacteristic::PROPERTY_WRITE);

  (void)pRxCharacteristic;

  pService->start();
  pServer->getAdvertising()->start();

  Serial.println("Adafruit MPU6050 test!");

  // ---- I2C init ----
  Wire.begin(I2C_SDA_PIN, I2C_SCL_PIN);

  // ==================================================
  // ADDED: INITIALIZE MPU6050
  // ==================================================

  if (!mpu.begin()) {
    Serial.println("MPU6050 was not found. Please check wiring.");

    while (1)
      delay(10);
  }

  Serial.println("MPU6050 found!");

  // ==================================================
  // ADDED: GET INITIAL ACCELERATION
  // ==================================================

  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);

  prevAccX = a.acceleration.x / 9.8;
  prevAccY = a.acceleration.y / 9.8;
  prevAccZ = a.acceleration.z / 9.8;

  // ADDED: initialize timer
  previousTime = millis();

  // ---- MAX30105 ----

  if (!particleSensor.begin(Wire, I2C_SPEED_FAST)) {
    Serial.println("MAX30105 was not found. Please check wiring. ");

    while (1)
      ;
  }

  Serial.println("Place your index finger on the sensor with steady pressure.");

  particleSensor.setup();
  particleSensor.setPulseAmplitudeRed(0x0A);
  particleSensor.setPulseAmplitudeGreen(0);

  // ---- Heart task ----

  xTaskCreatePinnedToCore(
      handleHeart,
      "Heart Rate",
      10000,
      NULL,
      1,
      &heartTask,
      0);
}

void loop() {

  sensors_event_t a, g, temp;

  mpu.getEvent(&a, &g, &temp);

  float ax = a.acceleration.x / 9.8;
  float ay = a.acceleration.y / 9.8;
  float az = a.acceleration.z / 9.8;

  // ==================================================
  // CHANGED: USE ACTUAL TIME
  // ==================================================

  unsigned long currentTime = millis();

  float dt = (currentTime - previousTime) / 1000.0;

  // Prevent division by zero
  if (dt > 0) {

    float jerkX = (ax - prevAccX) / dt;
    float jerkY = (ay - prevAccY) / dt;
    float jerkZ = (az - prevAccZ) / dt;

    // Update previous acceleration values
    prevAccX = ax;
    prevAccY = ay;
    prevAccZ = az;

    previousTime = currentTime;

    // Calculate jerk magnitude
    float jerkMagnitude =
        sqrt(jerkX * jerkX +
             jerkY * jerkY +
             jerkZ * jerkZ);

    // PRINT JERK
    Serial.print("Jerk: ");
    Serial.print(jerkMagnitude);
    Serial.println(" G/s");

    // Check for a fall
    if (jerkMagnitude > 15) {

      Serial.println("aigggaaa padloo");

      bleSend("Fall Detected!");

      while (true) {

        bleSend(String(beatAvg));

        digitalWrite(STATUS_LED_PIN, HIGH);
        delay(500);

        digitalWrite(STATUS_LED_PIN, LOW);
        delay(500);
      }
    }
  }

  delay(100);
}
