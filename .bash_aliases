# ----------------------------------------------------------------------------
# ALIASES
# ----------------------------------------------------------------------------
# Naviation
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias la='ls -A'
alias ll='ls -lah'
alias ld='ls -l | grep "^d"'
alias cp='cp -X' # Do NOT copy extended attributes

# Coding
alias phplines="find . -type f -name '*.php' -exec cat {} \; | wc -l | sed -e 's/^[ \t]*//g'"
alias cleanup='rm -rf `find . -type f -name .DS_Store`'
alias dirtree="find . -not \( -type d -name .svn -prune \) -print | sed -e 's;[^/]*/;|___;g;s;___|; |;g'"

# IP-addresses
alias ip="curl ifconfig.me/ip"
alias localip="ipconfig getifaddr en0"
alias ips="localip && ip"

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

function cleansvn() {
	echo -e "THIS WILL RECURSIVELY REMOVE ALL SVN DIRECTORIES."
	read -r -p "Do you want to continue? [yes/NO] " RESPONSE
	case $RESPONSE in
		[yY][eE][sS]|[yY])
			rm -rf `find . -type d -name .svn`
			;;
		*)
			;;
	esac
}
