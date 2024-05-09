{ pkgs, inputs, ... }: {

    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Electron -> use Wayland.
    xdg.portal = {
        enable = true;
        extraPortals = builtins.attrValues {
            inherit (pkgs)
                #xdg-desktop-portal-hyprland # ADD LATER !
                xdg-desktop-portal-gtk # Required.
            ;
        };
    };

    # Cachix for Hyprland
    # https://discourse.nixos.org/t/nixos-with-flake-not-using-hyprland-cachix/43406
    # For this to work, you need to disable `package` and enable the next settings.
    # Once your system has this settings enabled, then you can rebuild.
    nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
}
