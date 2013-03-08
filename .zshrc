# LOAD MODULES
# ------------

autoload -Uz compinit && compinit     # Load and run compinit
autoload -U zcalc                     # Load zcalc module
autoload -U colors && colors          # Load colors module
autoload -U promptinit && promptinit  # Load promptinit module

# SET OPTIONS
# -----------

setopt AUTO_CD        # When command is a directory `cd` to it
setopt AUTO_PUSHD     # Previous dir is accessible through `popd`
setopt PROMPT_SUBST   # Enable prompt substrings
setopt PUSHD_SILENT   # No `pushd` messages
setopt PUSHD_TO_HOME  # Blank `pushd` goes to home
set -o vi             # Enable vim mode for command line movement

# AUTO COMPLETION
# ---------------

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Match uppercase
zstyle ':completion:*' instert-tab pending           # Disable when pasting tab

# HISTORY
# -------

HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000
setopt EXTENDED_HISTORY      # Display time of use
setopt HIST_IGNORE_ALL_DUPS  # Ignore duplicate entries
setopt HIST_IGNORE_SPACE     # Ignore entries preceded by a space
setopt INC_APPEND_HISTORY    # Incrementally append history
setopt SHARE_HISTORY         # Share the history file across sessions

# EXPORTS
# -------

export CLICOLOR=1
export EDITOR=vi
export GREP_OPTIONS='--color=auto'
export LANG=en_US.UTF-8
export LSCOLORS=ExGxCxaCAxaGhEaBaBbhbh
export LS_COLORS="di=1;;40:ln=1;;40:so=1;;40:pi=0;:ex=1;;40:bd=0;:cd=37;:su=0;:sg=0;:tw=31;47:ow=31;47:"
export SUDO_EDITOR='/usr/bin/vi -p -X'
export SVN_EDITOR=vi
export TERM=xterm-256color
export VIRTUAL_ENV_DISABLE_PROMPT=1
export NODE_VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export _PATH=$PATH

# LESS
# ----

export PAGER=less                         # Use less for paging
export LESS_TERMCAP_mb=$'\e[01;31m'       # Begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # Begin bold
export LESS_TERMCAP_me=$'\e[0m'           # End mode
export LESS_TERMCAP_se=$'\e[0m'           # End standout-mode
export LESS_TERMCAP_so=$'\e[01;31;41m'    # Begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # End underline
export LESS_TERMCAP_us=$'\e[04;38;5;244m' # Begin underline

# FUNCTIONS & ALIASES
# -------------------

fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)                # Load all function in directory
[[ -f ~/.zsh/aliases ]] && source ~/.zsh/aliases  # Load aliases

# Fix slow git auto completion
__git_files () { _wanted files expl 'local files' _files }

# WIDGETS
# -------

# Insert `sudo` at the start (Esc-s)
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# Disable annoying clear screen shortcut (Ctrl-l)
do_nothing () { }
zle -N do_nothing
bindkey "^l" do_nothing

# Quick open vim (Ctrl-n)
bindkey -s "^n" "vim\n"

# PROMPT
# ------

local prompt_highlight="blue"

local prompt_datetime='$(pre_prompt_datetime)'
local prompt_dir='$(pre_prompt_dir)'
local prompt_history="%B%{$fg[black]%}[%h]%b%{$reset_color%}"
local prompt_jobs='$(pre_prompt_jobs)'
local prompt_name="%B%{$fg[black]%}[%n]%b%{$reset_color%}"
local prompt_newline='$(pre_prompt_newline)'
local prompt_node_env='$(pre_prompt_node_env)'
local prompt_repo='$(pre_prompt_repo)'
local prompt_shell='$(pre_prompt_shell)'
local prompt_subshell='$(pre_prompt_subshell)'
local prompt_virtual_env='$(pre_prompt_virtual_env)'

function pre_prompt_repo {
	if [[ -d ".svn" ]]; then
		local REV=$(svn info | grep "Revision" | awk '{print $2}')
		echo -e "%B%{$fg[black]%}[ %{$fg[green]%}svn%{$fg[black]%}:%{$fg[green]%}$REV %{$fg[black]%}]%{$reset_color%}"
	else
		pushd . >/dev/null
		while [ ! -d ".git" ] && [ ! "`pwd`" = "/" ]; do cd ..; done
		if [[ -d ".git" ]]; then
			local BRANCH=$(git rev-parse --abbrev-ref HEAD)
			local HASH=$(git rev-parse --short HEAD)
			echo -e "%B%{$fg[black]%}[ %{$fg[green]%}$BRANCH%{$fg[black]%}:%{$fg[green]%}$HASH %{$fg[black]%}]%{$reset_color%}"
		else
			echo ""
		fi
		popd >/dev/null
	fi
}

function pre_prompt_datetime {
	local HOUR="$(printf %.0f $(date '+%H'))"
	local H="%D{%H}"
	local M="%D{%M}"
	if [[ $HOUR -gt 8 ]] && [[ $HOUR -lt 18 ]]; then
		echo -e "%B%{$fg[black]%}[$H:$M]%{$reset_color%}%b"
	else
		echo -e "%B%{$fg[black]%}[ %{$fg[$prompt_highlight]%}$H%{$fg[black]%}:%{$fg[$prompt_highlight]%}$M %{$fg[black]%}]%{$reset_color%}%b"
	fi
}

function pre_prompt_dir {
	local DIR=${PWD/$HOME/\~}
	local DIRCOUNT=$((`echo $DIR|sed 's/[^\/]//g'|wc -m`-1))
	if [[ $DIRCOUNT > 4 ]]; then
		CNT=$(( $DIRCOUNT - 3 ))
		STR=`echo $(yes "." | head -n$CNT) | sed s/\ //g`
		DIR="`echo $DIR | awk -F\/ '{print $1,"/",$2,"/__DIRCOUNT__/",$(NF-1),"/",$(NF)}' | sed s/\ //g`"
		DIR=${DIR/__DIRCOUNT__/$STR}
	fi
	echo -e "%B%{$fg[black]%}[ %{$fg[$prompt_highlight]%}$DIR %{$fg[black]%}]%b%{$reset_color%}"
}

function pre_prompt_jobs {
	local JOBS="$(jobs -l | wc -l | awk '{print $1}')"
	if [[ $JOBS != 0 ]]; then
		echo -e "%B%{$fg[black]%}[ %{$fg[yellow]%}jobs:%j %{$fg[black]%}]%b%{$reset_color%}"
	else
		echo ""
	fi
}

function pre_prompt_newline {
	echo -e "%B\n%b"
}

function pre_prompt_node_env {
	if [[ -n "$NODE_VIRTUAL_ENV" ]]; then
		echo -e "%B%{$fg[black]%}[ %{$fg[yellow]%}$(basename $NODE_VIRTUAL_ENV) %{$fg[black]%}]%b%{$reset_color%}"
	else
		echo ""
	fi
}

function pre_prompt_shell {
	echo -e "%B%{$fg[$prompt_highlight]%}$%b%{$reset_color%}"
}

function pre_prompt_subshell {
	[[ -n "$VIMRUNTIME" ]] && local SUBSHELL="vim $SUBSHELL"
	SUBSHELL=`echo $SUBSHELL | sed 's/\ *$//g'`
	if [[ -n "$SUBSHELL" ]]; then
		echo -e "%B%{$fg[black]%}[ %{$fg[red]%}$SUBSHELL %{$fg[black]%}]%b%{$reset_color%}"
	else
		echo -e "${prompt_history}"
	fi
}

function pre_prompt_virtual_env {
	if [[ -n "$VIRTUAL_ENV" ]]; then
		echo -e "%B%{$fg[black]%}[ %{$fg[yellow]%}$(basename $VIRTUAL_ENV) %{$fg[black]%}]%b%{$reset_color%}"
	else
		echo ""
	fi
}

# MACHINE SPECIFIC CONFIGURATION
# ------------------------------

[[ $(uname) == Darwin ]] && source ~/.darwinrc
[[ $(uname) == Linux ]] && source ~/.linuxrc
[[ -f ~/.localrc ]] && source ~/.localrc

# RENDER PROMPT
# -------------

export PS1="${prompt_name}${prompt_dir}${prompt_virtual_env}${prompt_node_env}${prompt_repo}${prompt_jobs}${prompt_datetime}${prompt_newline}${prompt_subshell}${prompt_shell} "
