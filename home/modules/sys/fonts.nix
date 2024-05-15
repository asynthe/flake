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
