@echo off
title FallSafe Enterprise Manager Portal & Telemetry Bridge
echo =========================================================
echo   FallSafe(TM) Enterprise Manager Portal & Bridge Server
echo =========================================================
echo.
echo Starting telemetry bridge server on http://localhost:8080 ...
start "" "http://localhost:8080"
python "%~dp0server.py"
pause
