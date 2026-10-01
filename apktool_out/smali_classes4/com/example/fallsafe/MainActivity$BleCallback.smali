.class public Lcom/example/fallsafe/MainActivity$BleCallback;
.super Landroid/bluetooth/BluetoothGattCallback;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/fallsafe/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BleCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/fallsafe/MainActivity;


# direct methods
.method public constructor <init>(Lcom/example/fallsafe/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    return-void
.end method


# virtual methods

# p1 = gatt, p2 = status, p3 = newState
# BluetoothProfile.STATE_CONNECTED = 2
.method public onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 2

    # if newState == STATE_CONNECTED (2) and status == GATT_SUCCESS (0) -> connected
    const/4 v0, 0x2

    if-ne p3, v0, :cond_disconnected

    const/4 v0, 0x0

    if-ne p2, v0, :cond_disconnected

    # Connected: discover services
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    new-instance v1, Lcom/example/fallsafe/MainActivity$BleCallback$1;

    invoke-direct {v1, p0}, Lcom/example/fallsafe/MainActivity$BleCallback$1;-><init>(Lcom/example/fallsafe/MainActivity$BleCallback;)V

    invoke-virtual {v0, v1}, Lcom/example/fallsafe/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :cond_disconnected
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    new-instance v1, Lcom/example/fallsafe/MainActivity$BleCallback$2;

    invoke-direct {v1, p0}, Lcom/example/fallsafe/MainActivity$BleCallback$2;-><init>(Lcom/example/fallsafe/MainActivity$BleCallback;)V

    invoke-virtual {v0, v1}, Lcom/example/fallsafe/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 5

    const/4 v0, 0x0

    if-ne p2, v0, :cond_end

    # Get NUS service
    const-string v0, "6e400001-b5a3-f393-e0a9-e50e24dcca9e"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v1

    if-eqz v1, :cond_end

    # Get TX characteristic (NUS notify: ESP32 -> phone)
    const-string v0, "6e400003-b5a3-f393-e0a9-e50e24dcca9e"

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v2

    if-eqz v2, :cond_end

    # Enable notifications on the TX characteristic
    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3}, Landroid/bluetooth/BluetoothGatt;->setCharacteristicNotification(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z

    # Get the CCCD descriptor and write ENABLE_NOTIFICATION_VALUE
    const-string v3, "00002902-0000-1000-8000-00805f9b34fb"

    invoke-static {v3}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    move-result-object v3

    if-eqz v3, :cond_end

    sget-object v4, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_NOTIFICATION_VALUE:[B

    # Use API 33+ writeDescriptor(descriptor, value) -> returns int
    invoke-virtual {p1, v3, v4}, Landroid/bluetooth/BluetoothGatt;->writeDescriptor(Landroid/bluetooth/BluetoothGattDescriptor;[B)I

    :cond_end
    return-void
.end method

# API 33+ signature: onCharacteristicChanged(gatt, characteristic, value:[B)
.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;[B)V
    .locals 2

    if-eqz p3, :cond_end

    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {v0, p3, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-virtual {v1, v0}, Lcom/example/fallsafe/MainActivity;->processBleData(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_end
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method
