{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home =
    {
      # This value determines the Home Manager release that your
      # configuration is compatible with. This helps avoid breakage
      # when a new Home Manager release introduces backwards
      # incompatible changes.
      #
      # You can update Home Manager without changing this value. See
      # the Home Manager release notes for a list of state version
      # changes in each release.
      stateVersion = "22.05";
      username = "danny.lowwater";
      homeDirectory = "/Users/danny.lowater";

      packages = with pkgs; [
        # Shell
        zsh
        zsh-autosuggestions
        zsh-syntax-highlighting
        zsh-history-substring-search

        # Tools
        starship
        bat
        comma # shopify's comma
        direnv
        exa
        neovim
        ripgrep # required by neovim's Telescope
        fd
        wget
        tmux
        htop-vim

        # Git 
        git
        gitui
        gnupg

        # Languages
        # yarn # yarn installs by default 16.14.2 and doesn't adhear to other installed versions see https://github.com/NixOS/nixpkgs/issues/145634
        rust-analyzer
        wrangler
        # cargo installing these two manually as rust analyser can't find what it needs to run. see https://github.com/rust-lang/rust-analyzer/issues/9506
        # rustc
        fnm

        # Neovim deps
        cppcheck
        stylua
        rnix-lsp
        statix
        shellcheck

        # Work
        docker
        postgresql
        jdk11
      ];

      file = {
        # ~
        ".zshrc".source = ~/.dotfiles/home/zsh/.zshrc;
        ".zprofile".source = ~/.dotfiles/home/zsh/.zprofile;
        ".tmux.conf".source = ~/.dotfiles/home/.tmux.conf;
        ".gitignore_global".source = ~/.dotfiles/home/.gitignore_global;

        # ~/.config/ 
        ".config/nvim".source = ~/.dotfiles/home/nvim;
        ".config/nvim".recursive = true; # https://github.com/nix-community/home-manager/issues/2282
        ".config/git".source = ~/.dotfiles/home/git;
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
