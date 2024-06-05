{ pkgs, ... }: {

    #fonts.fontconfig = {
        #enable = true;
        #defaultFonts = {
            #emoji = ...;
            #monospace = ...;
            #sansSerif = ...;
            #serif = ...;
        #};
    #};

    home.packages = builtins.attrValues {
        inherit (pkgs)
            corefonts
            etBook # https://edwardtufte.github.io/et-book/
            font-awesome
            nerdfonts
            office-code-pro
            source-sans-pro
            #(nerdfonts.override { fonts = [  # DELETE -> HOME
              #"FiraCode"
              #"FiraMono"
              #"Iosevka"
              #"IosevkaTerm"
              #"JetBrainsMono"
              #"Meslo"
            #]; })
        ;
    };
}
