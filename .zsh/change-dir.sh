change_dir() {
  local search_dir=${1:-~}
  local max_depth=${2:-3}

  local dir
  dir=$(find "$search_dir" -maxdepth "$max_depth" -type d 2> /dev/null | fzf --height=20 --reverse --preview 'tree -C {}' --preview-window=right:60%) &&
  cd "$dir"
}

bindkey -s '^n' 'change_dir\n'
