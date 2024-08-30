{ config, pkgs, ... }: {

    # Making emacs be on the same repo
    # Will editing the config.org change the config.el

    # Do we need init.el? How to implement if it can change
    # Try with it and without it

    home.file = {
        ".config/emacs/config.org".source = config.lib.file.mkOutOfStoreSymlink ../../../../dots/emacs/config.org;
        ".config/emacs/README.org".source = config.lib.file.mkOutOfStoreSymlink ../../../../dots/emacs/README.org; # ???

        ".config/emacs/init.el".source = config.lib.file.mkOutOfStoreSymlink ../../../../dots/emacs/init.el;
    };

    home.packages = builtins.attrValues {
        inherit (pkgs)
            emacs29-pgtk
            #hunspell
        ;

        # Emacs Packages
        #inherit (pkgs.emacsPackages)
            #doom-modeline
            #doom-modeline-now-playing # Requires playerctl.
        #;

        # Hunspell dictionaries
        #inherit (pkgs.hunspellDicts)
            #fr-moderne # French (modern) from Dicollecte
            #es_MX # Spanish (Mexico) from rla
            #es_mx # Spanish (Mexico) from rla
            #es_CL # Spanish (Chile) from rla ?
            #es_cl
            #en_US # English (United States) from Wordlist
            #en_us
            #en_AU # English (Australia) from Wordlist
            #en_au
        #;
    };

    #programs.emacs = {
        #enable = true;
    #};
}
