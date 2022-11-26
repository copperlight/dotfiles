#!/usr/bin/env bash

DOTFILES_DIR=$(cd "$(dirname "$0")" || exit; pwd)

# icloud drive
ln -nsf "$HOME/Library/Mobile Documents/com~apple~CloudDocs" "$HOME/CloudDocs"

# secrets & snippets
mkdir -p "$HOME/.dotfiles.d"

for file in "$DOTFILES_DIR"/dotfiles.d/*; do
    ln -nsf "$file" "$HOME/.dotfiles.d/$(basename "$file")"
done

# vim
ln -nsf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"

# zsh
ln -nsf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -nsf "$DOTFILES_DIR/zprofile" "$HOME/.zprofile"

