#!/bin/bash

if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
export PATH=~/Library/Python/3.8/bin:$PATH

. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
eval "$(fnm env --use-on-cd)"
eval "$(direnv hook zsh)"
