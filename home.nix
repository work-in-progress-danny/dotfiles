{ pkgs, ... }:
{
  imports = [
    home/git
    home/local.nix
  ];

  home = {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
    # these are defined in ~/.dotfiles/home/local.nix
    # username = "";
    # homeDirectory = "";

    packages = with pkgs; [
      # Shell
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting
      zsh-history-substring-search

      # Tools
      starship # shell prompt
      comma # shopify's comma
      direnv # directory aware environment variables
      neovim # text editor
      ripgrep # grep replacement. required by neovim's Telescope
      fd # find replacement
      bat # cat replacement
      exa # ls replacement
      wget
      tmux # terminal multiplexer
      htop-vim # htop with vim bindings
      gh # github cli

      # Git
      git
      gitui # a tui for git

      # Languages
      rust-analyzer # rust language server
      wrangler # cloudflare worker cli
      fnm # "fast" node version manager
      # cargo installing these two manually as rust analyser can't find what it needs to run. see https://github.com/rust-lang/rust-analyzer/issues/9506
      # yarn installs by default 16.14.2 and doesn't adhear to other installed versions see https://github.com/NixOS/nixpkgs/issues/145634
      # rustc

      # Neovim deps
      cppcheck
      stylua
      rnix-lsp
      statix
      shellcheck
    ];

    file = {
      # ~/
      ".zshrc".source = ~/.dotfiles/home/zsh/.zshrc;
      ".zprofile".source = ~/.dotfiles/home/zsh/.zprofile;
      ".tmux.conf".source = ~/.dotfiles/home/.tmux.conf;
      ".ssh/config".source = ~/.dotfiles/home/ssh/config;

      # ~/.config/
      ".config/nvim" = {
        source = ~/.dotfiles/home/nvim;
        recursive = true; # https://github.com/nix-community/home-manager/issues/2282
      };
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
