# Windows Defender - Turn ON Completely
# Run this script as Administrator

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Windows Defender - Turn ON" -ForegroundColor Yellow
Write-Host "========================================`n" -ForegroundColor Cyan

try {
    Write-Host "[1/6] Enabling Real-Time Monitoring..." -ForegroundColor Yellow
    Set-MpPreference -DisableRealtimeMonitoring $false -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[2/6] Enabling Behavior Monitoring..." -ForegroundColor Yellow
    Set-MpPreference -DisableBehaviorMonitoring $false -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[3/6] Enabling IOAV Protection..." -ForegroundColor Yellow
    Set-MpPreference -DisableIOAVProtection $false -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[4/6] Enabling Script Scanning..." -ForegroundColor Yellow
    Set-MpPreference -DisableScriptScanning $false -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[5/6] Enabling Block At First Seen..." -ForegroundColor Yellow
    Set-MpPreference -DisableBlockAtFirstSeen $false -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[6/6] Enabling On Access Protection..." -ForegroundColor Yellow
    Set-MpPreference -DisableOnAccessProtection $false -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "  ✓ Windows Defender is now ON" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Cyan
    
    # Show current status
    Write-Host "Current Status:" -ForegroundColor Cyan
    $pref = Get-MpPreference
    Write-Host "  Real-Time Monitoring: $(if($pref.DisableRealtimeMonitoring){'OFF'}else{'ON'})" -ForegroundColor $(if($pref.DisableRealtimeMonitoring){'Red'}else{'Green'})
    Write-Host "  Behavior Monitoring: $(if($pref.DisableBehaviorMonitoring){'OFF'}else{'ON'})" -ForegroundColor $(if($pref.DisableBehaviorMonitoring){'Red'}else{'Green'})
    
} catch {
    Write-Host "`n✗ ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nPress Enter to close..." -ForegroundColor Cyan
Read-Host
