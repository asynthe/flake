#! /bin/bash

echo "Welcome to meow's macos setup script!"
echo "ようこそ！"

HOMEBREW_NO_AUTO_UPDATE=1

brew_install() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "$1 is installed"
    fi
}

brew_install "
    direnv 
    ffmpeg 
    mpv 
    neovim
    ripgrep 
    starship
    tmux
"
# zellij

# Brew Install
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Programs
#brew install --cask powershell
#brew install ffmpeg
#brew install imagemagick
#brew install starship
#brew install yazi

# Install Fonts
#brew install --cask font-jetbrains-mono-nerd-font
#brew install --cask font-iosevka-nerd-font
#brew install --cask font-iosevka-term-nerd-font
