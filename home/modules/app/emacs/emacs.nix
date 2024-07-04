{ pkgs, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            emacs29-pgtk
        ;
    };

    #programs.emacs = {
        #enable = true;
    #};
}
