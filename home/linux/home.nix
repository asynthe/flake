{
  username,
  pkgs,
  ...
}: {
  imports = [

    ../modules

    ./usr
    ./nix_configuration.nix
    ./pkgs.nix
    ./shell.nix

  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.05";
    #sessionVariables = {
      # MOVE ALL USER SESSION VARIABLES HERE!
      # EDITOR = "emacs";
    #};
  };

  programs.home-manager.enable = true; # Let Home Manager install and manage itself.
}
