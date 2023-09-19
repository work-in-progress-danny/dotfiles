if [ -e  ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# I would use source ~/.dotfiles/source/zshrc/* but randomly the zsh plugins stop working
source ~/.dotfiles/home/zsh/alias.sh
source ~/.dotfiles/home/zsh/preferences.sh
source ~/.dotfiles/home/zsh/plugins.sh
source ~/.dotfiles/home/zsh/environment.sh

if [ -e ~/.dotfiles/home/zsh/work.sh ]; then
  source ~/.dotfiles/home/zsh/work.sh
fi
