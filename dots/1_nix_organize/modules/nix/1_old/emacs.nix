{ pkgs, ... }: {

  # Emacs Overlay
  # https://github.com/nix-community/emacs-overlay

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };

  #nixpkgs.overlays = [
    #(import (builtins.fetchTarball {
      #url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    #}))
  #];

  home.packages = builtins.attrValues {
    # Emacs, maybe delete.
    #inherit
      #(pkgs)
      #emacs-pgtk # Latest PGTK build from emacs overlay.
      #;

    # Packages to install.
    inherit (pkgs.emacsPackages) sqlite3;
  };

}
