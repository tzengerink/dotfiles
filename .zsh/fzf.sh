# https://junegunn.github.io/fzf/
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--layout=default --walker-skip .git,node_modules,dist,coverage"
export FZF_CTRL_R_OPTS="--height=12"
export FZF_CTRL_T_OPTS="--tmux center,90%,90% --preview 'bat --color=always --style=numbers,changes --line-range :500 {}'"
export FZF_ALT_C_OPTS="--layout=reverse --preview 'tree -C {}'"

alias f='fzf'
