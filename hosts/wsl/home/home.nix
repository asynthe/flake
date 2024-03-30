{ config, pkgs, ... }: {

  # Fix for nixpkgs.allowUnfree = true
  # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
  nixpkgs.config = {
    allowUnfreePredicate = _: true;
    allowUnfree = true;
    permittedInsecurePackages = [
      "python3.10-requests-2.29.0"
      "electron-25.9.0"
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "ben";
    #username = username; # From old home config.
    homeDirectory = "/home/ben";
    #homeDirectory = "/home/${username}"; # From old home config.
    stateVersion = "23.11";
    #sessionVariables = {
    # MOVE ALL USER SESSION VARIABLES HERE!
    # EDITOR = "emacs";
    #};
  };
}
