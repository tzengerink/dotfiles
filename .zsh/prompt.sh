local prompt_user='$(pre_prompt_user)'
local prompt_dir='$(pre_prompt_dir)'
local prompt_newline='$(pre_prompt_newline)'
local prompt_node='$(pre_prompt_node)'
local prompt_python='$(pre_prompt_python)'
local prompt_repo='$(pre_prompt_branch)'
local prompt_shell='$(pre_prompt_shell)'
local prompt_exit='$(pre_prompt_exit)'

function pre_prompt_user {
  echo -e "%{$fg[white]%}%n  %{$reset_color%}"
}

function pre_prompt_exit {
	local SUCCESS="%{$fg[green]%}%j  %{$reset_color%}"
	local ERROR="%{$fg[red]%}%j  %{$reset_color%}"
	echo -e "%(?.$SUCCESS.$ERROR)"
}

function pre_prompt_branch {
	local BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if [[ -n $BRANCH ]]; then
		if [[ $BRANCH =~ ^(master|main)$ ]]; then
			echo -e "%{$fg[red]%}$BRANCH  %{$reset_color%}"
		elif [[ $BRANCH =~ ^develop$ ]]; then
			echo -e "%{$fg[yellow]%}$BRANCH  %{$reset_color%}"
		elif [[ $BRANCH =~ ^(feature|feat|refactor|chore|fix|docs)\/ ]]; then
			echo -e "%{$fg[blue]%}$BRANCH  %{$reset_color%}"
		else
			echo -e "%{$fg[white]%}$BRANCH  %{$reset_color%}"
		fi
	fi
}

function pre_prompt_dir {
	echo -e "%{$reset_color%}%{$fg[magenta]%}$(shrink_path -f)  %{$reset_color%}"
}

function pre_prompt_newline {
	echo -e "%b\n%b"
}

function pre_prompt_python {
	if [[ -d ".venv" ]] && which python >/dev/null; then
		echo -e "%{$reset_color%}%{$fg[yellow]%}$(python --version)  %{$reset_color%}"
	fi
}

function pre_prompt_node {
	if [[ -d "node_modules" ]] && which node >/dev/null; then
		echo -e "%{$reset_color%}%{$fg[yellow]%}$(node --version)  %{$reset_color%}"
	fi
}

export PROMPT="${prompt_user}${prompt_dir}${prompt_repo}${prompt_node}${prompt_python}${prompt_newline}${prompt_exit}"
