#!/usr/bin/env sh

DOTSHOME="$HOME/me/dots"
DOTSCONFIG="$HOME/me/dots/config"

echo "deploying dotfiles"

ln -f "$DOTSHOME/zshrc" "$HOME/.zshrc"
ln -f "$DOTSHOME/gitconfig" "$HOME/.gitconfig"

mkdir -p "$HOME/.config"
for item in "$DOTSCONFIG"/*; do
    name=$(basename "$item")
    ln -sf "$item" "$HOME/.config/$name"
done

echo "dotfiles deployed"
