{ config, pkgs, ... }: {

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors-white";
    size = 24;
    x11.defaultCursor = "capitaine-cursors-white";
  };

}
