# -- PROMPT & LSCOLORS -------------------------------------------------------
export CLICOLOR=1
if [ $TERM="xterm-256colors" ]; then
	export PS1='\[\e[38;5;241m\]\u@\h:\[\e[m\] \[\e[38;5;198m\]\w\[\e[m\] \[\e[38;5;241m\]$\[\e[m\] '
	export LSCOLORS=fxAxcxdxcxegedabagacbx
elif [ $TERM="xterm-colors" ]; then
	export PS1='\[\e[1;37m\]\u@\h:\[\e[m\] \[\e[1;35m\]\w\[\e[m\] \[\e[1;37m\]$\[\e[m\] '
	export LSCOLORS=fxHxcxdxcxegedabagacbx
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
