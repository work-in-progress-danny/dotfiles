if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

if [ -e  ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

source ~/.dotfiles/home/zsh/alias.sh
source ~/.dotfiles/home/zsh/preferences.sh
source ~/.dotfiles/home/zsh/plugins.sh
source ~/.dotfiles/home/zsh/environment.sh

# I would use source ~/.dotfiles/source/zshrc/* but randomly the zsh plugins stop working

eval "$(~/.nix-profile/bin/starship init zsh)"
