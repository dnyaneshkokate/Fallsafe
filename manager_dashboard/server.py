import http.server
import socketserver
import json
import os
import socket
import datetime
import urllib.parse
import threading
import time

PORT = 8080
UDP_PORT = 8088
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Live Telemetry State
telemetry_state = {
    "deviceId": "FallSafe",
    "employeeName": "John Miller",
    "employeeRole": "Scaffold Engineer",
    "department": "Sector 4 High-Rise",
    "status": "online",
    "heartRate": 78,
    "fallDetected": False,
    "latitude": 28.6139,
    "longitude": 77.2090,
    "battery": 95,
    "lastSync": datetime.datetime.now().strftime("%H:%M:%S"),
    "phoneConnected": True
}

# Fall Detections Archive / Log
fall_history = [
    {
        "id": "fall-001",
        "employeeName": "John Miller",
        "department": "Sector 4 High-Rise",
        "timestamp": (datetime.datetime.now() - datetime.timedelta(hours=2, minutes=15)).strftime("%Y-%m-%d %H:%M:%S"),
        "heartRate": 104,
        "latitude": 28.6139,
        "longitude": 77.2090,
        "status": "Resolved",
        "notes": "Impact detected via Seeed XIAO ESP32-C3. Checked by paramedic."
    }
]

def get_local_ip():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except Exception:
        return "127.0.0.1"

# UDP Beacon Thread for Auto-Discovery by Phone App
def start_udp_beacon():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    
    while True:
        try:
            ip = get_local_ip()
            message = json.dumps({
                "service": "FALLSAFE_PORTAL",
                "ip": ip,
                "port": PORT,
                "url": f"http://{ip}:{PORT}/api/telemetry"
            }).encode('utf-8')
            
            sock.sendto(message, ('<broadcast>', UDP_PORT))
            sock.sendto(message, ('255.255.255.255', UDP_PORT))
        except Exception as e:
            pass
        time.sleep(2)

class FallSafeRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=BASE_DIR, **kwargs)

    def do_GET(self):
        parsed = urllib.parse.urlparse(self.path)
        
        # API Endpoints
        if parsed.path == "/api/telemetry":
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps(telemetry_state).encode("utf-8"))
            return

        elif parsed.path == "/api/falls":
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps(fall_history).encode("utf-8"))
            return

        elif parsed.path == "/api/server_info":
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            info = {
                "service": "FALLSAFE_PORTAL",
                "ip": get_local_ip(),
                "port": PORT,
                "url": f"http://{get_local_ip()}:{PORT}"
            }
            self.wfile.write(json.dumps(info).encode("utf-8"))
            return

        # Serve static frontend files
        return super().do_GET()

    def do_POST(self):
        parsed = urllib.parse.urlparse(self.path)
        content_length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(content_length).decode("utf-8") if content_length > 0 else "{}"

        try:
            data = json.loads(body) if body else {}
        except Exception:
            data = {}

        # 1. Telemetry Post from Phone App
        if parsed.path == "/api/telemetry":
            now_str = datetime.datetime.now().strftime("%H:%M:%S")
            telemetry_state["lastSync"] = now_str
            telemetry_state["phoneConnected"] = True

            if "heartRate" in data:
                try:
                    telemetry_state["heartRate"] = int(data["heartRate"])
                except Exception:
                    pass
            if "status" in data:
                telemetry_state["status"] = data["status"]
            if "latitude" in data:
                try:
                    telemetry_state["latitude"] = float(data["latitude"])
                except Exception:
                    pass
            if "longitude" in data:
                try:
                    telemetry_state["longitude"] = float(data["longitude"])
                except Exception:
                    pass
            if "employeeName" in data:
                telemetry_state["employeeName"] = data["employeeName"]

            # Fall Detected payload from Phone App
            if data.get("fallDetected") is True or data.get("event") == "fall" or str(data.get("data", "")).lower().find("fall detected") != -1:
                telemetry_state["fallDetected"] = True
                telemetry_state["status"] = "fall_alert"
                
                # Add to Fall Detections Log
                new_fall = {
                    "id": f"fall-{len(fall_history)+1:03d}",
                    "employeeName": telemetry_state.get("employeeName", "John Miller"),
                    "department": telemetry_state.get("department", "Sector 4 High-Rise"),
                    "timestamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    "heartRate": telemetry_state.get("heartRate", 80),
                    "latitude": telemetry_state.get("latitude", 28.6139),
                    "longitude": telemetry_state.get("longitude", 77.2090),
                    "status": "Active Alert",
                    "notes": "Fall impact detected via Seeed XIAO ESP32-C3 over BLE, relayed by Phone App."
                }
                fall_history.insert(0, new_fall)

            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps({"success": True, "state": telemetry_state}).encode("utf-8"))
            return

        # 2. Acknowledge Fall Alert
        elif parsed.path == "/api/falls/acknowledge":
            telemetry_state["fallDetected"] = False
            if telemetry_state["status"] == "fall_alert":
                telemetry_state["status"] = "online"
            
            fall_id = data.get("id")
            for f in fall_history:
                if not fall_id or f["id"] == fall_id:
                    if f["status"] == "Active Alert":
                        f["status"] = "Acknowledged"

            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps({"success": True, "falls": fall_history}).encode("utf-8"))
            return

        # 3. Clear Fall Log
        elif parsed.path == "/api/falls/clear":
            fall_history.clear()
            self.send_response(200)
            self.send_header("Content-Type", "application/json")
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()
            self.wfile.write(json.dumps({"success": True}).encode("utf-8"))
            return

        self.send_response(404)
        self.end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

def main():
    local_ip = get_local_ip()
    print("=" * 60)
    print("   FALLSAFE(TM) ENTERPRISE TELEMETRY BRIDGE SERVER")
    print(f"   Local Access:        http://localhost:{PORT}")
    print(f"   Phone Bridge:        http://{local_ip}:{PORT}/api/telemetry")
    print(f"   UDP Auto-Discovery:  Port {UDP_PORT} Broadcast Beacon Active")
    print("=" * 60)
    
    # Start UDP Beacon thread
    beacon_thread = threading.Thread(target=start_udp_beacon, daemon=True)
    beacon_thread.start()

    socketserver.TCPServer.allow_reuse_address = True
    with socketserver.TCPServer(("", PORT), FallSafeRequestHandler) as httpd:
        print(f"Server listening on 0.0.0.0:{PORT}...")
        httpd.serve_forever()

if __name__ == "__main__":
    main()
