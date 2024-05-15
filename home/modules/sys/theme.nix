{ pkgs, ... }: {

    dconf.enable = true;
    home = {
        pointerCursor = {
            gtk.enable = true;
            package = pkgs.capitaine-cursors;
            name = "capitaine-cursors-white";
            size = 24;
            x11.defaultCursor = "capitaine-cursors-white";
        };
    };

    #gtk = {
        #enable = true;
        #theme = {
	        #name = "Adwaita-dark";
	        #package = pkgs.adwaita-qt;
            #name = "Materia-dark";
            #package = pkgs.materia-theme;
        #};
    #};

    #qt = {
        #enable = true;
	    #platformTheme.name = "gtk";
    #};
}
