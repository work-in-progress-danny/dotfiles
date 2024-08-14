source ~/.dotfiles/home/zsh/alias.sh
source ~/.dotfiles/home/zsh/preferences.sh
source ~/.dotfiles/home/zsh/plugins.sh
source ~/.dotfiles/home/zsh/environment.sh

if [ -e ~/.dotfiles/home/zsh/work.sh ]; then
  source ~/.dotfiles/home/zsh/work.sh
fi

# bun completions
[ -s "/Users/danny/.bun/_bun" ] && source "/Users/danny/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/danny/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
