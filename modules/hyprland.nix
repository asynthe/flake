{ config, pkgs, ... }: {

    programs.hyprland.enable = true;
    xdg.portal = {
        enable = true;
        extraPortals = builtins.attrValues {
            inherit (pkgs)
                xdg-desktop-portal-hyprland
                xdg-desktop-portal-gtk # Required.
            ;
        };
    };
}
