# ----------------------------------------------------------------------------
# EXPORTS
# ----------------------------------------------------------------------------
export PS1='\u@\h:\e[1;33m \w \e[m$ '
export EDITOR=vi
export SVN_EDITOR=vi
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# ----------------------------------------------------------------------------
# LOAD ADDITIONAL FILES (IF EXISTS)
# ----------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.shortcuts ]; then
	. ~/.shortcuts
fi
