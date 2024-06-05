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

            # JP
            sarasa-gothic
            noto-fonts
            noto-fonts-cjk
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-extra
            noto-fonts-emoji

            # JP
            ipafont
            kochi-substitute

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
