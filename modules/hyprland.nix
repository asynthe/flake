{ inputs, pkgs, ... }: {

    programs.hyprland.enable = true;
    xdg.portal = {
        enable = true;
        extraPortals = builtins.attrValues {
            inherit (pkgs)
                #xdg-desktop-portal-hyprland # For non-flake ver.
                xdg-desktop-portal-gtk # Required.
            ;
        };
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Make Electron use Wayland.
    };

    # Hyprland master branch.
    # Add `inputs` to the bindings, enable the cachix and then the package.
    programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    # Cachix for Hyprland
    # https://discourse.nixos.org/t/nixos-with-flake-not-using-hyprland-cachix/43406
    # For this to work, you need to disable `package` and enable the next settings.
    # Once your system has this settings enabled, then you can rebuild.
    nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
}
