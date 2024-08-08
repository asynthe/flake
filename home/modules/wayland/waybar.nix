{ config, pkgs, lib, ... }: {

    home.packages = builtins.attrValues {
        inherit (pkgs)
            waybar
        ;
    };

    home.file.".config/waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink ../../../dots/waybar/config.jsonc;
    home.file.".config/waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink ../../../dots/waybar/style.css;

    #programs.waybar = {
        #enable = true;
        #settings = ;
        #systemd = true;
    #};
}
