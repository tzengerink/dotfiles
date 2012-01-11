# Load external files:
# ~/.exports   - exports
# ~/.aliases   - aliases
# ~/.functions - functions
# ~/.localrc   - used for commands you do not want to commit
for FILE in ~/.{exports,aliases,functions,localrc}; do
	[ -r "$FILE" ] && source "$FILE"
done
unset FILE

# Auto completion
autoload -Uz compinit && compinit  # Auto complete

# Export prompt & LSCOLORS
COLORS=$(tput colors)
if [ $COLORS -eq 256 ]; then
	export PS1=$'%{\e[38;5;241m%}%n@%m:%{\e[0m%} %{\e[38;5;198m%}%~%{\e[0m%} %{\e[38;5;241m%}#%{\e[0m%} '
elif [ $COLORS -eq 8 ]; then
	export PS1=$'%{\e[1;37m%}%n@%m:%{\e[0m%} %{\e[1;35m%}%~%{\e[0m%} %{\e[1;37m%}#%{\e[0m%} '
else
	export PS1=$'%n@%m: %~ # '
fi
unset COLORS
