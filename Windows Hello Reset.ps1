# Windows Hello Reset
# Author: Rohit Gupta
# Run this script while signed in as the affected user.

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Windows Hello Reset" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "WARNING:" -ForegroundColor Red
Write-Host "This will remove the existing Windows Hello credentials."
Write-Host "Make sure you can sign in using your password."
Write-Host "On newer Windows 11 versions, stored passkeys may also be removed."
Write-Host ""

$confirmation = Read-Host "Type RESET to continue"

if ($confirmation -ne "RESET") {
    Write-Host ""
    Write-Host "Reset cancelled." -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Deleting Windows Hello container..." -ForegroundColor Yellow

$result = certutil.exe -DeleteHelloContainer 2>&1

Write-Host ""
$result | ForEach-Object { Write-Host $_ }

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "Windows Hello reset successfully." -ForegroundColor Green
    Write-Host ""
    Write-Host "Please sign out of Windows." -ForegroundColor Cyan
    Write-Host "Sign back in using your password and configure" -ForegroundColor Cyan
    Write-Host "Windows Hello again from Sign-in options." -ForegroundColor Cyan
}
else {
    Write-Host ""
    Write-Host "Windows Hello reset failed." -ForegroundColor Red
    Write-Host "Exit Code: $LASTEXITCODE" -ForegroundColor Red
}