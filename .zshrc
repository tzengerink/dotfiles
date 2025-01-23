# Load modules
autoload -Uz compinit && compinit     # Load and run compinit
autoload -U zcalc                     # Load zcalc module
autoload -U colors && colors          # Load colors module
autoload -U promptinit && promptinit  # Load promptinit module
autoload -U history-search-end        # Load history search module

# Vim mode
bindkey -v
set editing-mode vi
set blink-matching-paren on

# Set options
setopt AUTO_CD        # When command is a directory `cd` to it
setopt AUTO_PUSHD     # Previous dir is accessible through `popd`
setopt PROMPT_SUBST   # Enable prompt substrings
setopt PUSHD_SILENT   # No `pushd` messages
setopt PUSHD_TO_HOME  # Blank `pushd` goes to home

# Auto completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Match uppercase
zstyle ':completion:*' instert-tab pending           # Disable when pasting tab

# History
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000
setopt EXTENDED_HISTORY      # Display time of use
setopt HIST_IGNORE_ALL_DUPS  # Ignore duplicate entries
setopt HIST_IGNORE_SPACE     # Ignore entries preceded by a space
setopt INC_APPEND_HISTORY    # Incrementally append history
setopt SHARE_HISTORY         # Share the history file across sessions

# Exports
export CLICOLOR=1
export EDITOR='nvim'
export EMAIL='teun@zengerink.com'
export LANG=en_US.UTF-8
export LSCOLORS=HxahBbBbAxBbBbBxBxHxHx
export LS_COLORS="di=1;;97:ln=1;47;90:so=1;41;91:pi=1;41;91:ex=1;;90:bd=1;41;91:cd=1;41;91:su=0;;91:sg=1;;91:tw=1;;97:ow=1;;97"
export SUDO_EDITOR='/usr/bin/vi -p -X'
# export TERM=xterm-256color
export VIRTUAL_ENV_DISABLE_PROMPT=1
export NODE_VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH=/usr/local/sbin:/usr/local/bin:~/.bin:$PATH

# Aliases
[[ -f ~/.zsh/aliases ]] && source ~/.zsh/aliases

# less
export PAGER="less"                       # Use less for paging
export LESS_TERMCAP_mb=$'\e[01;31m'       # Begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # Begin bold
export LESS_TERMCAP_me=$'\e[0m'           # End mode
export LESS_TERMCAP_se=$'\e[0m'           # End standout-mode
export LESS_TERMCAP_so=$'\e[07;49;91m'    # Begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # End underline
export LESS_TERMCAP_us=$'\e[04;38;5;244m' # Begin underline
lesskey >/dev/null 2>&1

# fzf - https://junegunn.github.io/fzf/
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--layout=default --walker-skip .git,node_modules,dist,coverage"
export FZF_CTRL_R_OPTS="--height=12"
export FZF_CTRL_T_OPTS="--tmux center,90%,90% --preview 'bat --color=always --style=numbers,changes --line-range :500 {}'"
export FZF_ALT_C_OPTS="--layout=reverse --preview 'tree -C {}'"
# https://junegunn.github.io/fzf/tips/ripgrep-integration/
rfn() (
  local RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  local OPENER="$EDITOR {1} +{2}"
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" \
      --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --delimiter : \
      --tmux center,90%,90% \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)
bindkey -s '^\' 'rfn\n'
# https://github.com/junegunn/fzf-git.sh
source ~/.zsh/fzf-git.sh

# delta - https://github.com/dandavison/delta
export DELTA_PAGER="less -+X -+F"

## PROMPT
local prompt_user='%F%n%f'
local prompt_dir='$(pre_prompt_dir)'
local prompt_newline='$(pre_prompt_newline)'
local prompt_node='$(pre_prompt_node)'
local prompt_repo='$(pre_prompt_repo)'
local prompt_shell='$(pre_prompt_shell)'
local prompt_exit='$(pre_prompt_exit)'

function pre_prompt_exit {
	local SUCCESS="%{$fg[green]%}%j%{$reset_color%}"
	local ERROR="%{$fg[red]%}%j%{$reset_color%}"
	echo -e "%(?.$SUCCESS.$ERROR)"
}

function pre_prompt_repo {
	pushd . >/dev/null
	while [ ! -d ".git" ] && [ ! "`pwd`" = "/" ]; do cd ..; done
	if [[ -d ".git" ]]; then
		local BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
		local HASH=$(git rev-parse --short=8 HEAD 2>/dev/null)
    if [[ $BRANCH =~ ^(master|main)$ ]]; then
			local BRANCH="%{$fg[red]%}$BRANCH%{$reset_color%}"
		fi
    if [[ $BRANCH =~ ^develop$ ]]; then
			local BRANCH="%{$fg[yellow]%}$BRANCH%{$reset_color%}"
		fi
    if [[ $BRANCH =~ ^(feature|feat|refactor|chore|fix|docs)\/ ]]; then
			local BRANCH="%{$fg[blue]%}$BRANCH%{$reset_color%}"
		fi
		echo -e "%{$reset_color%}·$BRANCH·%{$reset_color%}%F%{$fg[cyan]%}$HASH%{$reset_color%}%f%{$reset_color%}"
	else
		echo ""
	fi
	popd >/dev/null
}

function pre_prompt_dir {
	local DIR=${PWD/$HOME/\~}
	local DIRCOUNT=$((`echo $DIR|sed 's/[^\/]//g'|wc -m`-1))
	if [[ $DIRCOUNT > 3 ]]; then
		CNT=$(( $DIRCOUNT - 2 ))
		STR=`echo $(yes "." | head -n$CNT) | sed s/\ //g`
		DIR="`echo $DIR | awk -F\/ '{print $1,"/",$2,"/__DIRCOUNT__/",$(NF)}' | sed s/\ //g`"
		DIR=${DIR/__DIRCOUNT__/$STR}
	fi
	echo -e "%{$reset_color%}·%{$fg[magenta]%}$DIR%{$reset_color%}"
}

function pre_prompt_newline {
	echo -e "%b\n%b"
}

function pre_prompt_node {
	if [[ -d "node_modules" ]] && which node >/dev/null; then
		echo -e "%{$reset_color%}·%F%{$fg[yellow]%}$(node --version)%f%{$reset_color%}"
	fi
}

# Load local config file if available
[[ -f ~/.localrc ]] && source ~/.localrc

export PROMPT="${prompt_user}${prompt_dir}${prompt_repo}${prompt_node}${prompt_newline}${prompt_exit}·> "

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
