{ config, pkgs, ... }: {

    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Electron -> use Wayland.
    xdg.portal = {
        enable = true;
        extraPortals = builtins.attrValues {
            inherit (pkgs)
                xdg-desktop-portal-hyprland # ADD LATER !
                xdg-desktop-portal-gtk # Required.
            ;
        };
    };
}
