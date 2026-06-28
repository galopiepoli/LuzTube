#!/bin/bash
# START_LuzTube.sh — Inicia el servidor LuzTube en macOS
# ============================================================

DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

echo ""
echo "  ╔═══════════════════════════════════════╗"
echo "  ║      ▶  LUZTUBE v5  [0;31mrevival[0m  [0m║"
echo "  ╚═══════════════════════════════════════╝"
echo ""

# ── Verificar Python3 ───────────────────────────────────
PYTHON=""
for cmd in python3 python; do
  if command -v "$cmd" &>/dev/null; then
    PYTHON="$cmd"
    break
  fi
done

if [ -z "$PYTHON" ]; then
  echo "  ❌ Python no encontrado. Instalalo con: brew install python"
  exit 1
fi

echo "  ✓ Usando: $($PYTHON --version 2>&1)"

# ── Obtener IP local ────────────────────────────────────
LOCAL_IP=$(ipconfig getifaddr en0 2>/dev/null || ifconfig en0 2>/dev/null | awk '/inet /{print $2}' | head -1)
if [ -z "$LOCAL_IP" ]; then
  LOCAL_IP=$(ipconfig getifaddr en1 2>/dev/null || ifconfig en1 2>/dev/null | awk '/inet /{print $2}' | head -1)
fi

# ── Iniciar servidor ────────────────────────────────────
echo ""
echo "  ──────────────────────────────────────────"
echo "   🌐 Servidor encendido"
echo ""
echo "   Local:  http://localhost:8080"
if [ -n "$LOCAL_IP" ]; then
  echo "   Red:    http://${LOCAL_IP}:8080"
  echo "   (accedé desde cualquier dispositivo en tu WiFi)"
fi
echo ""
echo "   Ctrl+C para detener"
echo "  ──────────────────────────────────────────"
echo ""

exec $PYTHON "$DIR/server.js"
