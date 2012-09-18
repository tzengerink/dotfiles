# LOAD MODULES
# ------------

autoload -Uz compinit && compinit     # Load and run compinit
autoload -U zcalc                     # Load zcalc module
autoload -U colors && colors          # Load colors module
autoload -U promptinit && promptinit  # Load promptinit module

# SET OPTIONS
# -----------

setopt AUTO_CD        # When command is a directory `cd` to it
setopt SHARE_HISTORY  # Share the history file across sessions
setopt AUTO_PUSHD     # Previous dir is accessible through `popd`
setopt PUSHD_SILENT   # No `pushd` messages
setopt PUSHD_TO_HOME  # Blank `pushd` goes to home
setopt IGNORE_EOF     # Only exit when `exit` or `logout` is used
setopt PROMPT_SUBST   # Enable prompt substrings
set -o vi             # Enable vim mode for command line movement

# AUTO COMPLETION
# ---------------

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Match uppercase
zstyle ':completion:*' instert-tab pending           # Disable when pasting tab

# FUNCTIONS & ALIASES
# -------------------

fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)                # Load all function in directory
[[ -f ~/.zsh/aliases ]] && source ~/.zsh/aliases  # Load aliases

# Insert `sudo` at the start (Esc-s)
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# EXPORTS
# -------

export CLICOLOR=1
export EDITOR=vi
export GREP_OPTIONS='--color=auto'
export LANG=en_US.UTF-8
export LSCOLORS=ExGxCxaCAxaGhEaBaBbhbh
export LS_COLORS="di=1;;40:ln=1;;40:so=1;;40:pi=0;:ex=1;;40:bd=0;:cd=37;:su=0;:sg=0;:tw=31;47:ow=31;47:"
export PAGER=less
export SUDO_EDITOR='/usr/bin/vi -p -X'
export SVN_EDITOR=vi
export TERM=xterm-256color

# HISTORY
# -------

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# PROMPT
# ------

local prompt_highlight="blue"
local prompt_name="%B%{$fg[black]%}[%n]%b%{$reset_color%}"
local prompt_time="%B%{$fg[black]%}[%D{%H:%M}]%b%{$reset_color%}"
local prompt_info="%B%{$fg[black]%}[%h,%j]%b%{$reset_color%}"
local prompt_branch='$(pre_prompt_branch)'
local prompt_dir='$(pre_prompt_dir)'
local prompt_shell='$(pre_prompt_shell)'

function pre_prompt_branch {
	if [[ -d .git ]]; then
		local BR=$(git rev-parse --abbrev-ref HEAD)
		echo -e "%B%{$fg[black]%}[$BR]%{$reset_color%}"
	else
		echo ""
	fi
}

function pre_prompt_dir {
	echo -e "%B%{$fg[black]%}[ %{$fg[$prompt_highlight]%}%~ %{$fg[black]%}]%b%{$reset_color%}"
}

function pre_prompt_shell {
	echo -e "\n%B%{$fg[$prompt_highlight]%}$%b%{$reset_color%}"
}

# MACHINE SPECIFIC CONFIGURATION
# ------------------------------

[[ $(uname) == Darwin ]] && source ~/.darwinrc
[[ $(uname) == Linux ]] && source ~/.linuxrc
[[ -f ~/.localrc ]] && source ~/.localrc

# RENDER PROMPT
# -------------

export PS1="${prompt_name}${prompt_dir}${prompt_time}${prompt_info}${prompt_branch}${prompt_shell} "
