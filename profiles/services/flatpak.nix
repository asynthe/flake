{ config, pkgs, lib, ... }:
with lib;
let
    cfg = config.services.flatpak;
in {
    options.services.flatpak.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up Flatpak.
        '';
    };

    config = mkIf cfg.enable {

        services.flatpak.enable = true;
        fonts.fontDir.enable = true; # Fix for flatpak not finding system installed fonts.
        
        xdg.portal = {
        enable = true;
            extraPortals = builtins.attrValues {
                inherit (pkgs)
	                xdg-desktop-portal-gtk
	            ;
            };
        };
    };
}
