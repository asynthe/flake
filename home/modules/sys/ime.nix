{ pkgs, ... }: {

    # Very helpful.
    # https://github.com/foo-dogsquared/nixos-config/blob/master/modules/home-manager/_private/suites/i18n.nix

    # Should be added by the i18n modules, this is just to make sure.
    systemd.user.sessionVariables = {
        #GTK_IM_MODULE = "wayland;fcitx"; # Wayland module ?
        GTK_IM_MODULE = "wayland"; # ?
        QT_IM_MODULE = "wayland;fcitx";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx";
        GLFW_IM_MODULE = "ibus";
    };

    home.packages = builtins.attrValues {
        inherit (pkgs)
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
        ;
    };

    i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = builtins.attrValues {
            inherit (pkgs)
                fcitx5-configtool
                fcitx5-gtk # Support for GTK-based programs.
                fcitx5-lua # Lua support.
                fcitx5-mozc # Japanese input.
                #fcitx5-rime # Chinese input.
                fcitx5-table-extra
                fcitx5-table-other
            ;
            inherit (pkgs.libsForQt5)
                fcitx5-qt # Supprort for QT-based programs.
            ;
        };
    };
}
