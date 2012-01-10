#!/bin/bash
# 
# Automatically create symbolic links to the dotfiles in your home folder

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Bash files
ln -s "$DIR/.bash_profile" ~/.bash_profile
ln -s "$DIR/.bashrc" ~/.bashrc
ln -s "$DIR/.bash_aliases" ~/.bash_aliases

# Vim files
ln -s "$DIR/.vimrc" ~/.vimrc
ln -s "$DIR/.vim" ~/.vim
