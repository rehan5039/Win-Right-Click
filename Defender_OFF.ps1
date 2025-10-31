# Windows Defender - Turn OFF Completely
# Run this script as Administrator

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  Windows Defender - Turn OFF" -ForegroundColor Yellow
Write-Host "========================================`n" -ForegroundColor Cyan

try {
    Write-Host "[1/6] Disabling Real-Time Monitoring..." -ForegroundColor Yellow
    Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[2/6] Disabling Behavior Monitoring..." -ForegroundColor Yellow
    Set-MpPreference -DisableBehaviorMonitoring $true -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[3/6] Disabling IOAV Protection..." -ForegroundColor Yellow
    Set-MpPreference -DisableIOAVProtection $true -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[4/6] Disabling Script Scanning..." -ForegroundColor Yellow
    Set-MpPreference -DisableScriptScanning $true -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[5/6] Disabling Block At First Seen..." -ForegroundColor Yellow
    Set-MpPreference -DisableBlockAtFirstSeen $true -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "[6/6] Disabling On Access Protection..." -ForegroundColor Yellow
    Set-MpPreference -DisableOnAccessProtection $true -ErrorAction Stop
    Write-Host "      ✓ Done" -ForegroundColor Green
    
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "  ✓ Windows Defender is now OFF" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Cyan
    
    # Show current status
    Write-Host "Current Status:" -ForegroundColor Cyan
    $pref = Get-MpPreference
    Write-Host "  Real-Time Monitoring: $(if($pref.DisableRealtimeMonitoring){'OFF'}else{'ON'})" -ForegroundColor $(if($pref.DisableRealtimeMonitoring){'Red'}else{'Green'})
    Write-Host "  Behavior Monitoring: $(if($pref.DisableBehaviorMonitoring){'OFF'}else{'ON'})" -ForegroundColor $(if($pref.DisableBehaviorMonitoring){'Red'}else{'Green'})
    
} catch {
    Write-Host "`n✗ ERROR: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "`nPossible reasons:" -ForegroundColor Yellow
    Write-Host "  1. Tamper Protection is ON - Disable it in Windows Security" -ForegroundColor White
    Write-Host "  2. Script not run as Administrator" -ForegroundColor White
    Write-Host "`nTo disable Tamper Protection:" -ForegroundColor Cyan
    Write-Host "  Windows Security > Virus & threat protection > Manage settings > Tamper Protection = OFF" -ForegroundColor Gray
}

Write-Host "`nPress Enter to close..." -ForegroundColor Cyan
Read-Host
