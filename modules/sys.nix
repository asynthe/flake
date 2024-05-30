{ pkgs, ... }: {

    services.gvfs.enable = true; # Needed for almost all file explorers.
    environment.binsh = "${pkgs.dash}/bin/dash"; # Change sh for dash.
    environment.systemPackages = builtins.attrValues { inherit (pkgs) ntfs3g; };

    # Fonts
    fonts.packages = builtins.attrValues {
        inherit (pkgs)
            #corefonts
            font-awesome
            nerdfonts
        ;
    };
}
