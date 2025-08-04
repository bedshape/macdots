#!/usr/bin/env sh

DOTSHOME="$HOME/bed/git/dots"
DOTSCONFIG="$HOME/bed/git/dots/config"

echo "deploying dotfiles"

ln -sf "$DOTSHOME/zshrc" "$HOME/.zshrc"
ln -sf "$DOTSHOME/gitconfig" "$HOME/.gitconfig"

mkdir -p "$HOME/.config"
for item in "$DOTSCONFIG"/*; do
    name=$(basename "$item")
    ln -sf "$item" "$HOME/.config/$name"
done

echo "dotfiles deployed"
