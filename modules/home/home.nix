{ username, pkgs, ... }: {

  # Fix for nixpkgs.allowUnfree = true
  # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
  nixpkgs.config = {
    allowUnfreePredicate = _: true;
    allowUnfree = true;
  };

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
