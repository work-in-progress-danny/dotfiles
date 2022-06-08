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
        # shell
        zsh
        zsh-autosuggestions
        zsh-syntax-highlighting
        zsh-history-substring-search
        starship
        bat
        comma # shopify's comma
        direnv
        exa
        stow
        neovim
        ripgrep # required by neovim's Telescope
        fd
        wget
        tmux
        # git 
        git
        gitui
        gnupg
        # languages
        # yarn # yarn installs by default 16.14.2 and doesn't adhear to other installed versions see https://github.com/NixOS/nixpkgs/issues/145634
        rust-analyzer
        wrangler
        # cargo installing these two manually as rust analyser can't find what it needs to run. see https://github.com/rust-lang/rust-analyzer/issues/9506
        # rustc 
        fnm
        stylua
        rnix-lsp
        statix
        # work
        docker
        postgresql
        jdk11
      ];

      file = {
        # .config files
        ".config/nvim".source = ./home/nvim;
        ".config/git".source = ./home/git;
        ".config/gitui".source = ./home/gitui;
        ".config/alacritty.yml".source = ./home/alacritty.yml;
        ".config/starship.toml".source = ./home/starship.toml;

        # ~/ files
        ".zshrc".source = ./home/zshrc/.zshrc;
        ".zprofile".source = ./home/.zprofile;
        ".tmux.conf".source = ./home/.tmux.conf;
        ".gitignore_global".source = ./home/.gitignore_global;
      };
    };

  # programs are defined [here](https://github.com/nix-community/home-manager/tree/master/modules/programs)
  programs = {
    home-manager.enable = true; # Let Home Manager install and manage itself.
  };

}
