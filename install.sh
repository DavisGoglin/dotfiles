#! /bin/bash

if ! [ -L ~/bin ]; then
	ln -s ~/dotfiles/bin ~/bin
fi

ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

mkdir -p ~/.config/hypr
ln -s ~/dotfiles/hyprland.conf ~/.config/hypr/hyprland.conf

mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim.lua ~/.config/nvim/init.lua

ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/ashell
ln -s ~/dotfiles/ashell.toml ~/.config/ashell/config.toml

mkdir -p ~/.config/waybar.style.css
ln -s ~/dotfiles/waybar.style.css ~/.config/waybar/style.css

mkdir -p ~/.config/fuzzel
ln -s ~/dotfiles/fuzzel.ini ~/.config/fuzzel/fuzzel.ini
