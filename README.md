# Dotfiles

All these settings and preferences are quite specific to me, myself and my Macbooks, use them as a reference rather than a "batteries included" setup

## Installation

I wouldn't recommend this as I don't have a comprehensive list of installed software, the dotfiles assume many things are already installed and this could break your dev environment.

1. install nix on the new system [reference](https://gist.github.com/mandrean/65108e0898629e20afe1002d8bf4f223)
2. add `home.nix` to `~/.config/nixpkgs/` with `cp ./config/nixpkgs ~/.config`
3. run `home-manager switch` to install all software
4. (this is a little weird) delete `~/.config/nixpkgs` with `rm ~/.config/nixpkgs` and run `stow .`
   to clear out the untracked (symlinked) `home.nix` file
5. restart shell with `zsh`

### Manual installation of packages

this is only temporary. Until Yarn and Cargo are usable on nix for my setup

#### Yarn

Yarn installs by default 16.14.2 and doesn't switch to other installed versions auto-magically [see issue](https://github.com/NixOS/nixpkgs/issues/14563)

[Yarnpkg.com/install](https://classic.yarnpkg.com/lang/en/docs/install/#mac-stable)

1. this should auto-magically install `curl -o- -L https://yarnpkg.com/install.sh | bash`

#### Cargo

Installing this manually as VScode's rust analyser can't find what it needs to run [see](https://github.com/rust-lang/rust-analyzer/issues/9506)

[Rust-lang.org/install](https://www.rust-lang.org/tools/install)

1. this should auto-magically install `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

## Current Tools

- Editor: [VsCode](https://github.com/microsoft/vscode)
- Terminal: [Alacritty](https://github.com/alacritty/alacritty#installation)
- Shell: [Zsh](https://zsh.sourceforge.io/Intro/intro_toc.html)
  - Prompt: [Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)
- Terminal Multiplexer: [Zellij](https://github.com/zellij-org/zellij#how-do-i-install-it)
- Git TUI: [Gitui](https://github.com/extrawurst/gitui#6--installation-top-)
- Dotfiles Manager: [GNU stow](https://www.gnu.org/software/stow/manual/stow.html)
- Package Manager: [Nix Home-Manager](https://github.com/nix-community/home-manager)
- A better cat command: [Bat](https://github.com/sharkdp/bat)
- A better ls command: [Exa](https://github.com/ogham/exa)

## Old Tools

- Dotfiles Managers: [Fresh](https://github.com/freshshell/fresh/), [Chezmoi](https://www.chezmoi.io/docs/install/)
- Package Manager: [Homebrew](https://brew.sh/)
- Terminals: [iTerm2](https://iterm2.com/), [Kitty](https://github.com/kovidgoyal/kitty)
- Terminal Multiplexer: [Tmux](https://github.com/tmux/tmux)
- Shell: [Fish Shell](https://fishshell.com/)
- Shell Prompts: [(Zsh) Powerlevel 10k](https://github.com/romkatv/powerlevel10k), [(Zsh) Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
- Zsh Plugin Manager: [Antigen](https://github.com/zsh-users/antigen)
