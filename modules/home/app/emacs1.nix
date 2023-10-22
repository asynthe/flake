{ config, pkgs, ... }:

{

  # Emacs Overlay
  # https://github.com/nix-community/emacs-overlay

  # Note: i'm disabling the emacs daemon, as i'm running it on Wayland.
  # If it starts before the compositor, it will give trouble as it thinks
  # it is being run under X.

  # Enabling the daemon and Pure GTK package (from the overlay.)
  #services.emacs = {
    #enable = true;
    #package = pkgs.emacs-pgtk;
  #};
  #nixpkgs.overlays = [
    #(import (builtins.fetchTarball {
      #url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    #}))
  #];

  # Choose your version
  #environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
     
      emacs-pgtk # Latest PGTK build from emacs overlay.
     
      emacs
      emacs-gtk
      emacs-nox # Without X toolkit
      emacs-macport # With macport patches
     
      emacs28-gtk2
     
      emacs29
      emacs29-nox # Without X toolkit
      emacs29-gtk2
      emacs29-gtk3
      emacs29-pgtk # Pure GTK build
      ;
    inherit 
      (pkgs.emacsPackages)
      # Packages to install.
        emacsPackages.sqlite3 # add to emacs packages declaration. 
        emacsPackages.wttrin
        emacsPackages.display-wttr
      ;
  };
#}
