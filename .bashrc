# -- PROMPT & LSCOLORS -------------------------------------------------------
export CLICOLOR=1
if [ $TERM="xterm-256colors" ]; then
	export PS1='\[\e[;38;5;241m\][ \u ][ \[\e[01;37m\]\w\[\e[;38;5;241m\] ]\n[ \! ]\[\e[01;37m\]$\[\e[0m\] '
else
	export PS1=$'%n@%m: %~ $ '
fi

# -- EDITOR ------------------------------------------------------------------
export EDITOR=vi
export SVN_EDITOR=vi

# -- HISTORY -----------------------------------------------------------------
export HISTCONTROL=ignoredups
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTTIMEFORMAT="%T  "
export HISTIGNORE="ls:ls *:ll:la:ld:cd:cd -:pwd:* --help"
