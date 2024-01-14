{ config, pkgs, ... }: {

  gtk = {
    enable = true;

    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };

    cursorTheme = {
      name = "Dark";
      package = pkgs.capitaine-cursors;
    };

    #iconTheme = { 
      #name = "";
      #package = "";
    #};
  };
}
