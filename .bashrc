# ----------------------------------------------------------------------------
# EXPORTS
# ----------------------------------------------------------------------------
export PS1='\u@\h:\e[1;33m \w \e[m$ '
export EDITOR=vi
export SVN_EDITOR=vi

# Color settings
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# History settings
export HISTIGNORE="ls:ls *:ll:la:ld:cd:cd -:pwd;exit:date:* --help"

# ----------------------------------------------------------------------------
# LOAD ADDITIONAL FILES (IF EXISTS)
# ----------------------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.shortcuts ]; then
	. ~/.shortcuts
fi
