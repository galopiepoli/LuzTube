#!/usr/bin/env python3
"""
LuzTube Server v5 — Sirve estáticos y /data.
Uso:  python3 server.js
"""
import http.server
import json
import os
import urllib.parse

PORT = 8080
HOST = "0.0.0.0"
DIR = os.path.dirname(os.path.abspath(__file__))
DATA_FILE = os.path.join(DIR, "data.json")


def load_data():
    if not os.path.exists(DATA_FILE):
        return {}
    try:
        with open(DATA_FILE, "r") as f:
            return json.load(f)
    except Exception:
        return {}


def save_data(delta):
    data = load_data()
    for k, v in delta.items():
        if v is None:
            data.pop(k, None)
        else:
            data[k] = v
    with open(DATA_FILE, "w") as f:
        json.dump(data, f, indent=2)
    return data


class LuzTubeHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIR, **kwargs)

    def do_GET(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path

        # /data (GET)
        if path == "/data":
            data = load_data()
            self.send_json(data)
            return

        # Default: servir archivos estáticos
        if path == "/":
            self.path = "/luztube_v5.html"
        return super().do_GET()

    def do_POST(self):
        parsed = urllib.parse.urlparse(self.path)
        path = parsed.path

        if path == "/data":
            length = int(self.headers.get("Content-Length", 0))
            body = self.rfile.read(length)
            try:
                delta = json.loads(body)
            except json.JSONDecodeError:
                self.send_json({"error": "JSON inválido"}, 400)
                return
            data = save_data(delta)
            self.send_json({"ok": True, "data": data})
            return

        self.send_json({"error": "Not Found"}, 404)

    def send_json(self, obj, status=200):
        payload = json.dumps(obj).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(payload)))
        self.send_header("Access-Control-Allow-Origin", "*")
        self.end_headers()
        self.wfile.write(payload)

    def end_headers(self):
        self.send_header("Access-Control-Allow-Origin", "*")
        super().end_headers()


def get_local_ip():
    import socket
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.settimeout(0.1)
        s.connect(("8.8.8.8", 80))
        ip = s.getsockname()[0]
        s.close()
        return ip
    except Exception:
        return None


if __name__ == "__main__":
    ip = get_local_ip()
    print(f"")
    print(f"  ╔═══════════════════════════════════════╗")
    print(f"  ║      ▶  LUZTUBE v5  revival          ║")
    print(f"  ╚═══════════════════════════════════════╝")
    print(f"")
    print(f"  Local:    http://localhost:{PORT}")
    if ip:
        print(f"  Red:      http://{ip}:{PORT}")
        print(f"  (accedé desde cualquier dispositivo en tu WiFi)")
    print(f"")
    print(f"  Presioná Ctrl+C para detener")
    print(f"")
    server = http.server.HTTPServer((HOST, PORT), LuzTubeHandler)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n  Servidor detenido.")
        server.server_close()
