{ inputs, lib, pkgs, ... }: {

    # Cachix
    nix.settings = {
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    xdg.portal = {
        xdgOpenUsePortal = true;
        extraPortals = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
        configPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
    };

    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        xwayland.enable = true;
        systemd = {
            enable = true;
            variables = [ "--all" ];
            extraCommands = lib.mkBefore [
                "systemctl --user stop graphical-session.target"
                "systemctl --user start hyprland-session.target"
            ];
        };
    };
}
