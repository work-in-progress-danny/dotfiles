{ pkgs, ... }:

{
  imports = [
    home/git
    home/local.nix
  ];

  home = {
    stateVersion = "23.05";

    # these are defined in ~/.dotfiles/home/local.nix
    # username = "";
    # homeDirectory = "";

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      # Shell
      starship # shell prompt
      zsh
      zsh-autosuggestions
      zsh-fzf-tab
      zsh-history-substring-search
      zsh-syntax-highlighting

      # Tools
      SDL2
      bat # cat replacement
      direnv # directory aware environment variables
      docker
      exa # ls replacement
      fd # find replacement
      fzf # fuzzy finder (required by zsh-fzf-tab)
      helix
      htop-vim # htop with vim bindings
      neovim # text editor
      ripgrep # grep replacement (required by neovim's Telescope)
      tmux # terminal multiplexer
      wget # download tool
      wrangler # cloudflare worker cli

      # Git
      git
      gitui # a tui for git
      gh # github cli

      # Languages
      lua
      fnm # "fast" node (version) manager

      # cargo installing these two manually as rust analyser can't find what it needs to run. see https://github.com/rust-lang/rust-analyzer/issues/9506
      # yarn installs by default 16.14.2 and doesn't adhear to other installed versions see https://github.com/NixOS/nixpkgs/issues/145634
      # rustc

      # Neovim deps
      cppcheck
      luarocks # lua package manager
      rnix-lsp # nix language server
      statix # nix formatter
    ];

    file = {
      # ~/
      ".zshrc".source = ~/.dotfiles/home/zsh/.zshrc;
      ".zprofile".source = ~/.dotfiles/home/zsh/.zprofile;
      ".tmux.conf".source = ~/.dotfiles/home/.tmux.conf;
      ".ssh/config".source = ~/.dotfiles/home/ssh/config;

      ".config/gitui".source = ~/.dotfiles/home/gitui;
      ".config/alacritty.yml".source = ~/.dotfiles/home/alacritty.yml;
      ".config/starship.toml".source = ~/.dotfiles/home/starship.toml;
    };
  };

  # programs are defined [here](https://github.com/nix-community/home-manager/tree/master/modules/programs)
  programs = {
    home-manager.enable = true; # have home-manager install and manage itself.
  };
} 
