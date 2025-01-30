export PAGER="less"

export LESS_TERMCAP_mb=$'\e[01;31m'       # Begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # Begin bold
export LESS_TERMCAP_me=$'\e[0m'           # End mode
export LESS_TERMCAP_se=$'\e[0m'           # End standout-mode
export LESS_TERMCAP_so=$'\e[07;49;91m'    # Begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # End underline
export LESS_TERMCAP_us=$'\e[04;38;5;244m' # Begin underline

lesskey >/dev/null 2>&1
