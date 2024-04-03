{ config, pkgs, ... }: {

    environment.binsh = "${pkgs.dash}/bin/dash"; # Change sh for dash.

    # Fonts
    fonts.packages = builtins.attrValues {
        inherit (pkgs)

            #corefonts
            font-awesome

            nerdfonts
            #(nerdfonts.override { fonts = [ 
              #"FiraCode"
              #"FiraMono"
              #"Iosevka"
              #"IosevkaTerm"
              #"JetBrainsMono"
              #"Meslo"
            #]; })

            # JP
            ipafont
            kochi-substitute
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
        ;
    };

    # IME - fcitx5 + mozc
    i18n = {
        supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
        inputMethod = {
            enabled = "fcitx5";
            fcitx5.addons = with pkgs; [
                fcitx5-mozc
                fcitx5-configtool
            ];
        };
    };
}
