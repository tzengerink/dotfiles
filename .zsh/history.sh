HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000

setopt EXTENDED_HISTORY      # Display time of use
setopt HIST_IGNORE_ALL_DUPS  # Ignore duplicate entries
setopt HIST_IGNORE_SPACE     # Ignore entries preceded by a space
setopt INC_APPEND_HISTORY    # Incrementally append history
setopt SHARE_HISTORY         # Share the history file across sessions
