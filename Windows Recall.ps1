# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # Relaunch as administrator
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Start-Transcript -Path "C:\Temp\Recall\Log.txt"
# Check if Recall feature is enabled or disabled
Write-Host "Checking Recall feature status..." -ForegroundColor Cyan
$recallStatus = Invoke-Expression "Dism /Online /Get-Featureinfo /Featurename:Recall"

# Disable Recall if it's enabled
if ($recallStatus -match "State : Enabled") {
    Write-Host "Recall feature is enabled. Disabling..." -ForegroundColor Yellow
    Invoke-Expression "Dism /Online /Disable-Feature /Featurename:Recall"
    Write-Host "Recall feature has been disabled." -ForegroundColor Green
} else {
    Write-Host "Recall feature is already disabled." -ForegroundColor Green
}
Stop-Transcript