# Load external files:
# ~/.exports   - exports
# ~/.aliases   - aliases
# ~/.functions - functions
# ~/.extra     - used for commands you do not want to commit
for FILE in ~/.{exports,aliases,functions,extra}; do
	[ -r "$FILE" ] && source "$FILE"
done
unset FILE
