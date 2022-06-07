{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "danny";
  home.homeDirectory = "/Users/danny";

  home.packages = with pkgs; [
    # shell
    zsh
    bat
    comma # shopify's comma
    direnv
    exa
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    stow
    neovim
    ripgrep
    fd
    tmux
    # git 
    git
    gitui
    gnupg
    starship
    # languages
    # yarn yarn installs by default 16.14.2 and doesn't adhear to other installed versions see https://github.com/NixOS/nixpkgs/issues/145634
    rust-analyzer
    wrangler
    # cargo installing these two manually as rust analyser can't find what it needs to run. see https://github.com/rust-lang/rust-analyzer/issues/9506
    # rustc 
    stylua
    rnix-lsp
    fnm
    # work
    docker
    postgresql
    jdk11
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
