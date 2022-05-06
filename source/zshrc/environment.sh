eval "$(fnm env --use-on-cd)"

source $HOME/.cargo/env

export GPG_TTY=`tty`

eval "$(direnv hook zsh)"

