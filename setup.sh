#!/bin/bash
#
# Automatically create symbolic links to the dotfiles in your home folder.
#
# Copyright (c) T. Zengerink
# See: https://raw.github.com/Mytho/dotfiles/master/LICENSE

DIR="$(cd "$(dirname "$0")" && pwd)"

# Loop and check if directory or file exists
# Backup if so, then create symlink
for FILE in `find $DIR -maxdepth 1 -name ".*" \! -name "." \! -name ".dotfiles" \! -name ".git"`; do
	BASENAME="$(basename "$FILE")"
	if [ -f ~/$BASENAME ] || [ -d ~/$BASENAME ]; then
		mv ~/$BASENAME ~/$BASENAME~
		echo -e "Backup for $BASENAME created"
	fi
	ln -s $FILE ~/$BASENAME
done

git submodule init
git submodule update
vim +PluginInstall +qall
