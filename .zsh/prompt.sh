local prompt_user='%n  '
local prompt_dir='$(pre_prompt_dir)'
local prompt_newline='$(pre_prompt_newline)'
local prompt_node='$(pre_prompt_node)'
local prompt_repo='$(pre_prompt_repo)'
local prompt_shell='$(pre_prompt_shell)'
local prompt_exit='$(pre_prompt_exit)'

function pre_prompt_exit {
	local SUCCESS="%{$fg[green]%}%j  %{$reset_color%}"
	local ERROR="%{$fg[red]%}%j  %{$reset_color%}"
	echo -e "%(?.$SUCCESS.$ERROR)"
}

function pre_prompt_repo {
	pushd . >/dev/null
	while [ ! -d ".git" ] && [ ! "`pwd`" = "/" ]; do cd ..; done
	if [[ -d ".git" ]]; then
		local BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ $BRANCH =~ ^(master|main)$ ]]; then
			local BRANCH="%{$fg[red]%}$BRANCH  %{$reset_color%}"
		fi
    if [[ $BRANCH =~ ^develop$ ]]; then
			local BRANCH="%{$fg[yellow]%}$BRANCH  %{$reset_color%}"
		fi
    if [[ $BRANCH =~ ^(feature|feat|refactor|chore|fix|docs)\/ ]]; then
			local BRANCH="%{$fg[blue]%}$BRANCH  %{$reset_color%}"
		fi
		echo -e "$BRANCH"
	else
		echo ""
	fi
	popd >/dev/null
}

function pre_prompt_dir {
	echo -e "%{$reset_color%}%{$fg[magenta]%}$(shrink_path -f)  %{$reset_color%}"
}

function pre_prompt_newline {
	echo -e "%b\n%b"
}

function pre_prompt_node {
	if [[ -d "node_modules" ]] && which node >/dev/null; then
		echo -e "%{$reset_color%}%{$fg[yellow]%}$(node --version)  %{$reset_color%}"
	fi
}

export PROMPT="${prompt_user}${prompt_dir}${prompt_repo}${prompt_node}${prompt_newline}${prompt_exit}"
