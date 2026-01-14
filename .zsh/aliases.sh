# global
alias -g L='| less -S'
alias -g T='| tail'
alias -g J='| python3 -mjson.tool'
alias -g C='| pbcopy'

# tools
alias g='git'
alias t="tmux new-session -A -s main -d \; new-session -A -s side -d \; attach-session -t main"
alias n='nvim'
alias o='opencode --port'
