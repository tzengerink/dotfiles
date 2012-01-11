# -- LOAD EXTERNAL FILES -----------------------------------------------------
# ~/.exports     - exports
# ~/.aliases     - aliases
# ~/.functions   - functions
# ~/.localrc     - used for commands you do not want to commit
for FILE in ~/.{exports,aliases,functions,localrc}; do
	[ -r "$FILE" ] && source "$FILE"
done
unset FILE

# -- AUTO COMPLETION ---------------------------------------------------------
autoload -Uz compinit && compinit  # Auto complete

# -- PROMPT & LSCOLORS -------------------------------------------------------
if [ $TERM="xterm-256colors" ]; then
	export PS1=$'%{\e[38;5;241m%}%n@%m:%{\e[0m%} %{\e[38;5;198m%}%~%{\e[0m%} %{\e[38;5;241m%}#%{\e[0m%} '
elif [ $TERM="xterm-colors" ]; then
	export PS1=$'%{\e[1;37m%}%n@%m:%{\e[0m%} %{\e[1;35m%}%~%{\e[0m%} %{\e[1;37m%}#%{\e[0m%} '
else
	export PS1=$'%n@%m: %~ # '
fi
