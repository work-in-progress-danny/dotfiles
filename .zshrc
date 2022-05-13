if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

if [ -e  ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# if [ "$ZELLIJ" = "" ]; then zellij; fi # Start shell with Zellij 

source ~/.dotfiles/source/zshrc/alias.sh
source ~/.dotfiles/source/zshrc/preferences.sh
source ~/.dotfiles/source/zshrc/plugins.sh
source ~/.dotfiles/source/zshrc/environment.sh
# source ~/.dotfiles/source/zshrc/work.sh
# I would use source ~/.dotfiles/source/zshrc/* but randomly the zsh plugins stop working

eval "$(~/.nix-profile/bin/starship init zsh)"
