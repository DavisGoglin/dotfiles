#! /bin/bash

if ! [ -L ~/bin ]; then
	ln -s ~/dotfiles/bin ~/bin
fi

ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty.toml

# nvim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim/init.lua

# tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

