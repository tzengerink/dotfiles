#!/bin/bash
# 
# Automatically create symbolic links to the dotfiles in your home folder

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Loop and check if directory or file exists
# Backup if so, then create symlink
for FILE in `find $DIR -name ".*" -mindepth 1`
do
	BASENAME=$(basename "$FILE")
	if [ -f ~/$BASENAME ] || [ -d ~/$BASENAME ]; then
		mv ~/$BASENAME ~/$BASENAME~
		echo -e "Backup for $BASENAME created"
	fi
	ln -s $FILE ~/$BASENAME
	echo -e "Link for $BASENAME created"
done
