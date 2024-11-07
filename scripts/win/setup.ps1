Write-Output "Welcome to meow's windows setup script!"
# Write-Output "ようこそ！"
Start-Sleep -Milliseconds 700

Write-Output "-------------- Powershell --------------"
Start-Sleep -Milliseconds 500

Write-Output "Powershell: Creating a profile"
Start-Sleep -Milliseconds 100
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}

Write-Output "Powershell: Removing welcome message"
Start-Sleep -Milliseconds 100
Add-Content -Path $PROFILE -Value '$Host.UI.RawUI.WindowTitle = "PowerShell"; Clear-Host'

Write-Output "-------------- Winget --------------"
Start-Sleep -Milliseconds 500

Write-Output "Checking for Winget updates..."
winget upgrade --id Microsoft.DesktopAppInstaller -e --silent

$programs = @(
    "7zip.7zip",
    "Discord.Discord"
    "File-New-Project.EarTrumpet"
    "Git.Git",
    "Gyan.FFmpeg"
    "KeePassXCTeam.KeePassXC"
    "LibreWolf.LibreWolf"
    "Microsoft.VisualStudioCode",
    "MullvadVPN.MullvadVPN"
    "Neovim.Neovim"
    "Notepad++.Notepad++"
    "RARLab.WinRAR"
    "VLC.VLC",
    "Valve.Steam"
    "qBittorrent.qBittorrent"
    "wez.wezterm"
    "Spotify.Spotify"
    "PuTTY.PuTTY"
    "Microsoft.VisualStudioCode"
    "Malwarebytes.Malwarebytes"

    # CPU-Z
    #"CPUID.CPU-Z"
    "CPUID.CPU-Z.MSI" # MSI Ver.

    # CrystalDiskInfo
    #"CrystalDewWorld.CrystalDiskInfo"
    "CrystalDewWorld.CrystalDiskInfo.KureiKeiEdition"
    #"CrystalDewWorld.CrystalDiskInfo.ShizukuEdition"

    # CrystalDiskMark
    #"CrystalDewWorld.CrystalDiskMark"
    #"CrystalDewWorld.CrystalDiskMark.ShizukuEdition"
)

Write-Output "Listing installed programs..."
$installedPrograms = winget list

# Check for missing programs and install them
foreach ($program in $programs) {

    # Check if the program is already installed
    if ($installedPrograms -notcontains $program) {
        Write-Output "Installing $program"
        winget install --id $program --exact --silent
        Write-Output "$program installation complete."
    } else {
        Write-Output "$program is already installed."
    }
}

Write-Output "-------------- Finalizing --------------"
Start-Sleep -Milliseconds 200
Write-Output "Setup completed! Please restart PowerShell to apply changes."
