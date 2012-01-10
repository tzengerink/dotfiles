# ----------------------------------------------------------------------------
# ALIASES
# ----------------------------------------------------------------------------
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias la='ls -A'
alias ll='ls -lah'
alias cp='cp -X' # Do NOT copy extended attributes
alias rmallsvn='rm -rf `find . -type d -name .svn`'
alias rmalldsstore='rm -rf `find . -type f -name .DS_Store`'
alias twc="find . -type f -name '*.php' -exec cat {} \; | wc -l | sed -e 's/^[ \t]*//g'"
alias ttree="find . -not \( -type d -name .svn -prune \) -print | sed -e 's;[^/]*/;|___;g;s;___|; |;g'"
alias tip='curl ifconfig.me/ip'

# ----------------------------------------------------------------------------
# FUNCTIONS
# ----------------------------------------------------------------------------
function tgrep() {
	if test "$1" = ""
	then
		echo "No string given.."
	else
		find . -type f \! -path "*.svn*" -exec egrep -Hn --color "$1" {} \;
	fi
}
