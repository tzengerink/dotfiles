# Load modules
autoload -Uz compinit && compinit     # Load and run compinit
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
zstyle ':completion:*' insert-tab pending            # Disable when pasting tab

# Exports
export CLICOLOR=1
export EDITOR='nvim'
export EMAIL='teun@zengerink.com'
export LANG=en_US.UTF-8
export SUDO_EDITOR='/usr/bin/vi -p -X'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export NODE_VIRTUAL_ENV_DISABLE_PROMPT=1
export PATH=/usr/local/sbin:/usr/local/bin:~/.bin:$PATH

# Source all scripts in ~/.zsh
for f in ~/.zsh/*; do [[ -f $f ]] && source $f; done

# Load local config file if available
[[ -f ~/.localrc ]] && source ~/.localrc
