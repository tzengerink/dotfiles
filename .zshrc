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
export CLICOLOR=1
export EDITOR=vi
export LANG=en_US.UTF-8
export PAGER=less
export SVN_EDITOR=vi

# -- HISTORY -----------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# -- PROMPT & LSCOLORS (http://geoff.greer.fm/lscolors/) ---------------------
export LSCOLORS=ExGxCxaCAxaGhEaBaBbhbh
export LS_COLORS="di=1;;40:ln=1;;40:so=1;;40:pi=0;:ex=1;;40:bd=0;:cd=37;:su=0;:sg=0;:tw=31;47:ow=31;47:"
export PS1=$'%{\e[1;30m%}%n@%m:%{\e[0m%} %{\e[1;34m%}%~%{\e[0m%} %{\e[1;30m%}#%{\e[0m%} '
if [ -f "/bin/dircolors" ]; then
	export TERM=xterm-256color
	eval `/bin/dircolors ~/.dircolors`
	export TERM=xterm-256color
fi
