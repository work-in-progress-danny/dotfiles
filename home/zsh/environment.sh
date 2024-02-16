#!/bin/bash

if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi

eval "$(starship init zsh)"

export PATH="/opt/homebrew/bin:$PATH"
# eval "$(fnm env --use-on-cd)"

source "$HOME/.cargo/env"
