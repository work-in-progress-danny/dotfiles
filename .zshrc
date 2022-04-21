if [ "$ZELLIJ" = "" ]; then zellij; fi # Start shell with Zellij 

source ~/.dotfiles/source/zshrc/alias.sh
source ~/.dotfiles/source/zshrc/preferences.sh
source ~/.dotfiles/source/zshrc/plugins.sh
# source ~/.dotfiles/zshrc/work.sh

path=(
      /usr/local/{bin,sbin}
      ./node_modules/.bin
      $HOME/bin
      $HOME/go/bin
      $HOME/Applications/Visual Studio Code.app/Contents/Resources/app/bin
      $path
     )

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export GPG_TTY=`tty`

if [ -e  ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

eval "$(direnv hook zsh)"
eval "$(~/.nix-profile/bin/starship init zsh)"
