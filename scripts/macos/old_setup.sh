#! /bin/bash

echo "Welcome to meow's macOS setup script!"
echo "ようこそ！"

HOMEBREW_NO_AUTO_UPDATE=1

echo '-------------- Installing Homebrew --------------'
brew_check() {
    echo "Checking for Homebrew installation..."
    if brew -v &>/dev/null; then
        echo "Homebrew is already installed!"
    else
        # Brew Install
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

echo '-------------- Installing Programs --------------'
brew_install() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "Done!"
        #brew install $1 && echo "$1 is installed"
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
    fzf
    sk
    zellij
    zoxide
    eza
    yazi
"

echo '-------------- Installing Programs (Cask) --------------'
brew_install_cask() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask $1 && echo "Done!"
        #brew install $1 && echo "$1 is installed"
    fi
}

brew_install_cask "
    powershell
"

echo '-------------- Installing Fonts --------------'
brew_install_fonts() {
    echo "Installing $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask $1 && echo "Done!"
        #brew install $1 && echo "$1 is installed"
    fi
}

brew_install_fonts "
    font-jetbrains-mono-nerd-font
    font-iosevka-nerd-font
    font-iosevka-term-nerd-font
"
