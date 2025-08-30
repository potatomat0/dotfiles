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
    elif [[ "$file" == "kitty" ]]; then
        # Ensure kitty directory in ~/.config is a symlink to the repo folder
        mkdir -p "$HOME/.config"
        dest="$HOME/.config/kitty"
        if [[ -e "$dest" || -L "$dest" ]]; then
            # Backup existing kitty config (file/dir/symlink) before replacing
            ts=$(date +%s)
            mv -f "$dest" "$HOME/.config_backup/kitty_$ts" 2>/dev/null || true
            rm -rf "$dest"
        fi
        ln -s "$PWD/$file" "$dest"
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
