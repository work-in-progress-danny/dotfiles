eval "$(fnm env --use-on-cd)"

if [ "$TMUX" = "" ]; then tmux new-session -A -s main; fi

source $HOME/.cargo/env

export GPG_TTY=`tty`

eval "$(direnv hook zsh)"

# path=(
#       /usr/local/{bin,sbin}
#       ./node_modules/.bin
#       $HOME/bin
#       $HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin
#       $path
#      )

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
