# .zsh/fzf-jobs.sh

fzf_jobs_widget() {
  # Create a temporary file to avoid subshell issues with jobs command
  local job_file
  job_file=$(mktemp)

  # Write jobs to temp file (this avoids subshell issues)
  if jobs -l > "$job_file" 2>/dev/null; then
    # Use fzf to select jobs from the temp file with multi-selection
    local selected_jobs
    selected_jobs=$(fzf --multi --height=10 --reverse --header="Select job(s)" < "$job_file" | awk '{gsub(/[][]/, ""); print $1}')

    # If jobs were selected, insert them at cursor position with % prefix
    if [[ -n $selected_jobs ]]; then
      # Process each selected job and format as %1 %2 %3 etc.
      local formatted_jobs
      while IFS= read -r job_id; do
        formatted_jobs+="%${job_id} "
      done <<< "$selected_jobs"

      # Insert formatted jobs at current cursor position
      LBUFFER+="${formatted_jobs% }"  # Remove trailing space
      # Move cursor to the end of the inserted text
      CURSOR=$#LBUFFER
    fi
  else
    # No jobs available
    zle -M "No background jobs found"
  fi

  # Clean up temp file
  rm -f "$job_file"

  # Reset the prompt
  zle reset-prompt
}

# Register the widget
zle -N fzf_jobs_widget

# Bind Ctrl-L to the widget
bindkey '^L' fzf_jobs_widget
