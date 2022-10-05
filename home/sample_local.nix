{
  home = {
    username = "";
    homeDirectory = "";

    sessionVariables = {
      VARIABLE_NAME = "value"; # useful for machine specific keys
    };
  };


  programs.git = {
    userName = "";
    userEmail = "";

    extraConfig = {
      user.signingkey = "";
    };
  };
}
