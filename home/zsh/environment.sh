#!/bin/bash

if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi

GPG_TTY="$(tty)"

# PATH="
#        $HOME/bin
#        $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
#      "

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
     

eval "$(fnm env --use-on-cd)"
eval "$(direnv hook zsh)"

export GPG_TTY
export PATH
