# -- AUTO COMPLETION ---------------------------------------------------------
autoload -Uz compinit && compinit                    # Load
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Match uppercase
zstyle ':completion:*' instert-tab pending           # Disable when pasting tab

# -- FUNCTIONS & EXTERNAL FILES ----------------------------------------------
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)                # Load all function in directory
[[ -f ~/.zsh/aliases ]] && source ~/.zsh/aliases  # Load aliases
[[ -f ~/.localrc ]] && source ~/.localrc          # Used for machine specific commands

# -- EXPORTS -----------------------------------------------------------------
export PAGER=less
export CLICOLOR=1
export EDITOR=vi
export SVN_EDITOR=vi

# -- HISTORY -----------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# -- PROMPT & LSCOLORS -------------------------------------------------------
export LSCOLORS=cxAxgxdxbxegedabagacbx
export PS1=$'%{\e[1;30m%}%n@%m:%{\e[0m%} %{\e[0;31m%}%~%{\e[0m%} %{\e[1;30m%}#%{\e[0m%} '