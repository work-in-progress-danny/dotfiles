{
  programs.git = {
    # these are defined in ~/.dotfiles/home/local.nix
    # userName = "";
    # userEmail = "";
    # user.signingkey = "";
    enable = true;

    extraConfig = {
      branch.autorebase = true; # When pulling changes to your current branch try rebase instead of auto merge
      gpg.format = "ssh";

      commit = {
        gpgsign = true;
        template = "~/.dotfiles/home/git/.commitmessage";
        verbose = true;
      };

      core = {
        excludesfile = "~/.dotfiles/home/git/.gitignore_global";
        editor = "nvim";
      };

      merge.conflictStyle = "diff3";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
}
