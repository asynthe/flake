{ pkgs, ... }: {

    fonts.fontconfig = {
        enable = true;
        #defaultFonts = {
            #emoji = ...;
            #monospace = ...;
            #sansSerif = ...;
            #serif = ...;
        #};
    };

    home.packages = builtins.attrValues {
        inherit (pkgs)
            font-awesome
            nerdfonts
            office-code-pro
            source-sans-pro
            etBook # https://edwardtufte.github.io/et-book/
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
