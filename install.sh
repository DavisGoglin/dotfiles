#! /bin/bash

if ! [ -L ~/bin ]; then
	ln -s ~/dotfiles/bin ~/bin
fi

ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty.toml

mkdir -p ~/.config/hypr
ln -s ~/dotfiles/hyprland.conf ~/.config/hypr/hyprland.conf

mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim/init.lua

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/waybar
ln -s ~/dotfiles/waybar ~/.config/waybar/config
