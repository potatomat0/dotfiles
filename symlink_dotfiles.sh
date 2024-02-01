#!/bin/bash

# Check for root permissions and prompt for sudo if needed
if [[ $EUID -ne 0 ]]; then
    sudo "$0" "$@"
    exit
fi

# Navigate to the dotfiles directory
cd "$HOME/dotfiles"

# Create a backup directory for existing config files (optional)
mkdir -p ~/.config_backup

# Symlink configuration files to their appropriate locations
for file in *; do
    if [[ "$file" == ".tmux.conf" || "$file" == ".zshrc" || "$file" == ".gitconfig" ]]; then
        ln -sf "$PWD/$file" "$HOME/$file"
    elif [[ "$file" == "newsboat" ]]; then
	ln -sf "$PWD/$file" "$HOME/.newsboat"
    else
        ln -sf "$PWD/$file" "$HOME/.config/$file"
    fi
done

# Optional: Back up any existing config files before overwriting
for file in ~/.config/*; do
    if [[ -f "$file" ]]; then
        mv "$file" ~/.config_backup/
    fi
done

echo "Symlinks created successfully!"

