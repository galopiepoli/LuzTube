@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

cd /d "%~dp0"

echo.
echo   ╔═══════════════════════════════════════╗
echo   ║      ^>  LUZTUBE v5  revival          ║
echo   ╚═══════════════════════════════════════╝
echo.

REM ── Buscar Python ─────────────────────────────
set PYTHON=
for %%c in (python3 python) do (
    where %%c >nul 2>&1 && set PYTHON=%%c && goto :found
)
echo   ❌ Python no encontrado.
echo      Instalalo desde: https://www.python.org/downloads/
echo      ^(marcá "Add Python to PATH" al instalarlo^)
pause
exit /b 1

:found
echo   ✓ Usando: %PYTHON%
%PYTHON% --version 2>&1
echo.

REM ── Obtener IP local ─────────────────────────
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /C:"IPv4"') do set IP=%%a
set IP=%IP: =%
if not defined IP for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /C:"Direcci"') do set IP=%%a
if not defined IP set IP=

echo.
echo   ──────────────────────────────────────────
echo    🌐 Servidor encendido
echo.
echo    Local:  http://localhost:8080
if defined IP echo    Red:    http://%IP%:8080
if defined IP echo    ^(accedé desde cualquier dispositivo en tu WiFi^)
echo.
echo    Ctrl+C para detener
echo   ──────────────────────────────────────────
echo.

%PYTHON% "%~dp0server.js"
pause
