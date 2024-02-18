#!/bin/bash

# Check for root permissions and prompt for sudo if needed
if [[ $EUID -ne 0 ]]; then
    sudo "$0" "$@"
    exit
fi

# Securely install zsh if not already present
if ! command -v zsh &> /dev/null; then
    sudo pacman -S --needed zsh
fi

# Check and make zsh the default shell
if [[ "$(grep -c '^zsh$' /etc/shells)" -eq 0 ]]; then
    echo '/usr/bin/zsh' | sudo tee -a /etc/shells
fi
chsh -s $(which zsh)

# Install oh my zshell

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install yay if not already present
if ! command -v yay &> /dev/null; then
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

# Array of packages to install
packages=(
    "kitty"
    "ttf-jetbrains-mono-nerd"
    "nvim"
    "ripgrep"
    "lazygit"
    "btop"
    "nicotine+"
    "git"
    "fzf"
    "nvim-packer-git"
    "zoxide"
    "sampler"
    "tmux"
    "zathura"
    "bandcamp-dl-git"
    "obsidian-bin"
    "code"
    "pandoc-bin"
    "obsidian"
    "nnn"
    "cmus"
    "nnn"
    "sed"
    "newsboat"  # Add more packages here as needed
)

# Install packages using yay
yay -S "${packages[@]}"
 "Packages installed successfully!"

