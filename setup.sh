#!/bin/bash
# 
# Automatically create symbolic links to the dotfiles in your home folder

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Bash files

if [ -f ~/.bash_profile ]; then
	mv ~/.bash_profile ~/.bash_profile~
	echo -e "Backed up: .bash_profile"
fi
ln -s "$DIR/.bash_profile" ~/.bash_profile
echo -e "Link to .bash_profile create"

if [ -f ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc~
	echo -e "Backed up: .bashrc"
fi
ln -s "$DIR/.bashrc" ~/.bashrc
echo -e "Link to .bashrc create"

if [ -f ~/.bash_aliases ]; then
	mv ~/.bash_aliases ~/.bash_aliases~
	echo -e "Backed up: .bash_aliases"
fi
ln -s "$DIR/.bash_aliases" ~/.bash_aliases
echo -e "Link to .bash_aliases create"


# Vim files

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc~
	echo -e "Backed up: .vimrc"
fi
ln -s "$DIR/.vimrc" ~/.vimrc
echo -e "Link to .vimrc create"

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim~
	echo -e "Backed up: .vim"
fi
ln -s "$DIR/.vim" ~/.vim
echo -e "Link to .vim create"


# Git files

if [ -d ~/.gitconfig ]; then
	mv ~/.gitconfig ~/.gitconfig~
	echo -e "Backed up: .gitconfig"
fi
ln -s "$DIR/.gitconfig" ~/.gitconfig
echo -e "Link to .gitconfig create"

if [ -d ~/.gitignore ]; then
	mv ~/.gitignore ~/.gitignore~
	echo -e "Backed up: .gitignore"
fi
ln -s "$DIR/.gitignore" ~/.gitignore
echo -e "Link to .gitignore create"
