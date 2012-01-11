# Load external files:
# ~/.exports   - exports
# ~/.aliases   - aliases
# ~/.functions - functions
# ~/.localrc   - used for commands you do not want to commit
for FILE in ~/.{exports,aliases,functions,localrc}; do
	[ -r "$FILE" ] && source "$FILE"
done
unset FILE

# Set prompt
export PS1=$'%n@%m: %{\e[1;33m%}%~ %{\e[0m%}# '

# Enable completion
autoload -Uz compinit
compinit
