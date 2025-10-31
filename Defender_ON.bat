@echo off
:: Enable Windows Defender - Run as Administrator
title Turning ON Windows Defender

echo.
echo ========================================
echo   Windows Defender - Turn ON
echo ========================================
echo.

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script requires Administrator privileges!
    echo Please right-click and select "Run as Administrator"
    pause
    exit /b 1
)

echo [1/6] Enabling Real-Time Monitoring...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [2/6] Enabling Behavior Monitoring...
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $false" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [3/6] Enabling IOAV Protection...
powershell -Command "Set-MpPreference -DisableIOAVProtection $false" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [4/6] Enabling Script Scanning...
powershell -Command "Set-MpPreference -DisableScriptScanning $false" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [5/6] Enabling Block At First Seen...
powershell -Command "Set-MpPreference -DisableBlockAtFirstSeen $false" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [6/6] Enabling On Access Protection...
powershell -Command "Set-MpPreference -DisableOnAccessProtection $false" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo.
echo ========================================
echo   Windows Defender is now ON
echo ========================================
echo.
pause
