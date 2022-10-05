{
  home = {
    username = "";
    homeDirectory = "";

    sessionVariables = {
      VARIABLE_NAME = "value"; # useful for machine specific keys
    };

    packages = with pkgs; [
      # define any machine specific packages
    ];
  };


  programs.git = {
    userName = "";
    userEmail = "";

    extraConfig = {
      user.signingkey = "";
    };
  };
}
