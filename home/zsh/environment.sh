#!/bin/bash

if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=~/Library/Python/3.8/bin:$PATH

# eval "$(fnm env --use-on-cd)"
# eval "$(direnv hook zsh)"

eval "$(/opt/homebrew/bin/starship init zsh)"

export PATH=/Users/danny.lowater/Library/Android/sdk/platform-tools:$PATH

source "$HOME/.cargo/env"
# curl -s -H \"Accept: text/plain\" https://icanhazdadjoke.com/ | cowsay
