# Cool programs
# - cpu-z [MSI version]
# - crystaldiskinfo [Anime version]
# WINGET Programs
# - ...
#
# Symlinks

Write-Output "Welcome to meow's windows setup script!"
Write-Output "ようこそ！"

# Check if running as Admin
Function Start-AdminSession {
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        # Restart PowerShell as Administrator
        Start-Process powershell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`""
        exit
    }
}

# Run the function to elevate the session if not already running as Administrator
Start-AdminSession

# Create the profile file if it does not exist
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force # Execution Policy

# Setup
Add-Content -Path $PROFILE -Value '$Host.UI.RawUI.WindowTitle = "PowerShell"; Clear-Host' # Supress startup message

Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser # Revert Execution Policy

Write-Output "Setup completed! Please restart PowerShell to apply changes."
