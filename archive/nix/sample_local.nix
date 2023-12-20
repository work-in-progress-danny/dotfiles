{ pkgs, ... }:

{
  home = {
    username = ""; # "danny"
    homeDirectory = ""; # "/Users/danny";

    sessionVariables = {
      # VARIABLE_NAME = "value"; # useful for machine specific keys
    };

    packages = with pkgs; [
      # define any machine specific packages
    ];
  };


  programs.git = {
    userName = ""; # you can have emoji's here as git supports utf-8 encoding
    userEmail = "";

    extraConfig = {
      user.signingkey = "";
    };
  };
}
