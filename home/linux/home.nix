{ username, pkgs, ... }:

{

  imports = [

    ./desktop
    #../../dev

    #./hyprland # DROPPED FOR NOW
    #./xmonad # DROPPED FOR NOW

  ];

  # Fix for nixpkgs.allowUnfree = true
  # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
  nixpkgs.config.allowUnfreePredicate = (_: true);
  nixpkgs.config.allowUnfree = true;

  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.home-manager.enable = true; # Let Home Manager install and manage itself.
  home.stateVersion = "23.05";

  home.sessionVariables = {
    # MOVE ALL USER SESSION VARIABLES HERE!
    # EDITOR = "emacs";
  };

  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };

  home.file = { # Manage dotfiles

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/asynthe/etc/profile.d/hm-session-vars.sh
  # if you don't want to manage your shell through Home Manager.

}
