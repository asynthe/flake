#! /bin/bash

echo "Welcome to meow's macos setup script!"
echo "ようこそ！"
sleep 2

echo "-------------- Checking if Homebrew is installed --------------"
sleep 0.5
HOMEBREW_NO_AUTO_UPDATE=1

# Brew Install
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "-------------- Installing packages --------------"
sleep 0.5
brew_install() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 >/dev/null 2>&1 && echo "Installed $1"
    fi
}

brew_install "
    direnv 
    eza
    ffmpeg 
    fzf
    imagemagick
    mpv 
    neovim
    ripgrep 
    sk
    starship
    starship
    tmux
    yazi
    zellij
    zoxide
    tmuxp
"

echo "-------------- Installing packages (cask) --------------"
sleep 0.5
brew_install_cask() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask $1 >/dev/null 2>&1 && echo "Installed $1"
    fi
}

brew_install_cask "
    powershell
    wezterm
"

echo "-------------- Installing fonts (cask) --------------"
sleep 0.5
brew_install_cask_fonts() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask $1 >/dev/null 2>&1 && echo "Installed $1"
    fi
}

brew_install_cask_fonts "
    font-iosevka-nerd-font
    font-iosevka-term-nerd-font
    font-jetbrains-mono-nerd-font
"

echo "-------------- Installer has finished! --------------"
sleep 2
