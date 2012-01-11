# Load external files:
# ~/.exports   - exports
# ~/.aliases   - aliases
# ~/.functions - functions
# ~/.localrc   - used for commands you do not want to commit
for FILE in ~/.{exports,aliases,functions,localrc}; do
	[ -r "$FILE" ] && source "$FILE"
done
unset FILE
