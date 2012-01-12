# -- AUTO COMPLETION ---------------------------------------------------------
autoload -Uz compinit && compinit

# -- FUNCTIONS & EXTERNAL FILES ----------------------------------------------
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t) # load all function in directory
source ~/.zsh/aliases              # aliases
source ~/.localrc                  # used for machine specific commands

# -- EDITOR ------------------------------------------------------------------
export EDITOR=vi
export SVN_EDITOR=vi

# -- PROMPT & LSCOLORS -------------------------------------------------------
if [ $TERM="xterm-256colors" ]; then
	export PS1=$'%{\e[38;5;241m%}%n@%m:%{\e[0m%} %{\e[38;5;198m%}%~%{\e[0m%} %{\e[38;5;241m%}#%{\e[0m%} '
elif [ $TERM="xterm-colors" ]; then
	export PS1=$'%{\e[1;37m%}%n@%m:%{\e[0m%} %{\e[1;35m%}%~%{\e[0m%} %{\e[1;37m%}#%{\e[0m%} '
else
	export PS1=$'%n@%m: %~ # '
fi
