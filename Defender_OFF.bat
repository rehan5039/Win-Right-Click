@echo off
:: Disable Windows Defender - Run as Administrator
title Turning OFF Windows Defender

echo.
echo ========================================
echo   Windows Defender - Turn OFF
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

echo [1/6] Disabling Real-Time Monitoring...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED - Check Tamper Protection])

echo [2/6] Disabling Behavior Monitoring...
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $true" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [3/6] Disabling IOAV Protection...
powershell -Command "Set-MpPreference -DisableIOAVProtection $true" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [4/6] Disabling Script Scanning...
powershell -Command "Set-MpPreference -DisableScriptScanning $true" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [5/6] Disabling Block At First Seen...
powershell -Command "Set-MpPreference -DisableBlockAtFirstSeen $true" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo [6/6] Disabling On Access Protection...
powershell -Command "Set-MpPreference -DisableOnAccessProtection $true" 2>nul
if %errorLevel% equ 0 (echo       [OK]) else (echo       [FAILED])

echo.
echo ========================================
echo   Windows Defender is now OFF
echo ========================================
echo.
echo NOTE: If you see FAILED messages, disable Tamper Protection:
echo Windows Security ^> Virus ^& threat protection ^> Manage settings
echo.
pause
