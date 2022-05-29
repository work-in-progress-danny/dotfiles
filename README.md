# Dotfiles

All these settings and preferences are quite specific to me, myself and my MacBooks, use them as a reference rather than a "batteries included" setup.

## Installation

I wouldn't recommend this as I don't have a comprehensive list of installed software, the dotfiles assume many things are already installed and this could break your dev environment.

1. Install nix on the new system see [reference](https://gist.github.com/mandrean/65108e0898629e20afe1002d8bf4f223).
2. Add `home.nix` to `~/.config/nixpkgs/` with `cp ./config/nixpkgs ~/.config`
3. run `home-manager switch` to install all software
4. (this is a little weird) delete `~/.config/nixpkgs` with `rm ~/.config/nixpkgs` and run `stow .`
   to clear out the untracked (symlinked) `home.nix` file
5. restart shell with `zsh`

### Manual installation of packages

This is only temporary. Until Yarn is usable on nix for my setup

#### Yarn

Yarn installs by default 16.14.2 and doesn't switch to other installed versions auto-magically [see issue](https://github.com/NixOS/nixpkgs/issues/14563)

[Yarnpkg.com/install](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)

1. this should auto-magically install `curl -o- -L https://yarnpkg.com/install.sh | bash`

## Current Tools

- Editor: [Neovim](https://github.com/neovim/neovim)
- Terminal: [Alacritty](https://github.com/alacritty/alacritty#installation)
    - Terminal Multiplexer: [Zellij](https://github.com/zellij-org/zellij#how-do-i-install-it)
- Shell: [Zsh](https://zsh.sourceforge.io/Intro/intro_toc.html)
  - Prompt: [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
  - Zsh Plugin Manger: [Nix Home-Manager](https://github.com/nix-community/home-manager)
  - Zsh Plugins:
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Dotfiles Manager: [GNU stow](https://www.gnu.org/software/stow/manual/stow.html)
- Package Manager: [Nix Home-Manager](https://github.com/nix-community/home-manager)
- CLI apps: 
    - A better cat: [Bat](https://github.com/sharkdp/bat)
    - A better ls: [Exa](https://github.com/ogham/exa)
    - Git TUI: [Gitui](https://github.com/extrawurst/gitui#6--installation-top-)

## Old Tools

- Editors: [VsCode](https://github.com/microsoft/vscode), [LunarVim ("batteries included" Neovim config)](https://github.com/lunarvim/lunarvim)
- Terminals: [iTerm2](https://iterm2.com/), [Kitty](https://github.com/kovidgoyal/kitty)
    - Terminal Multiplexer: [Tmux](https://github.com/tmux/tmux)
- Shell: [Fish Shell](https://fishshell.com/)
    - Prompts: [(Zsh) Powerlevel 10k](https://github.com/romkatv/powerlevel10k), [(Zsh) Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
    - Zsh Plugin Manager: [Antigen](https://github.com/zsh-users/antigen)
- Dotfiles Managers: [Fresh](https://github.com/freshshell/fresh/), [Chezmoi](https://www.chezmoi.io/docs/install/)
- Package Manager: [Homebrew](https://brew.sh/)

