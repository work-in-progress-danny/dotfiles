# Sensible Zsh config
# https://www.viget.com/articles/zsh-config-productivity-plugins-for-mac-oss-default-shell/
setopt auto_cd # auto change directories
setopt hist_ignore_dups # do not enter command lines into the history list if they are duplicates of the previous event.
setopt append_history # zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file
setopt extended_history # save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file
setopt hist_expire_dups_first # if the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event from the list.
setopt inc_append_history # this option works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits
setopt share_history # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file
HISTSIZE=50000 # number of commands to save
SAVEHIST=10000 # The history is trimmed when its length excedes SAVEHIST by 20%
HISTFILE="$HOME/.zsh_history"

export STARSHIP_CONFIG="$HOME/.config/starship.toml"

export RANGER_LOAD_DEFAULT_RC=false

export EXA_COLORS="da=32" # da: timestamp

export PATH=~/Library/Python/3.8/bin:$PATH
