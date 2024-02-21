{ config, pkgs, ... }: {

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors-white";
    size = 24;
    x11.defaultCursor = "capitaine-cursors-white";
  };

  # OLD GTK CONFIG
  #gtk = {
    #enable = true;
    #theme = {
      #name = "Materia-dark";
      #package = pkgs.materia-theme;
    #};
    #cursorTheme = {
      #name = "Dark";
      #package = pkgs.capitaine-cursors;
    #};
    #iconTheme = { 
      #name = "";
      #package = "";
    #};
  #};
}
