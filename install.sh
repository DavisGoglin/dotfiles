#! /bin/bash

ln -s ~/dotfiles/bin ~/bin

# nvim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim/init.lua

# tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

