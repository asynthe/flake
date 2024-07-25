{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.framework.gaming;
in {
    options.framework.gaming.steam = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable Steam and gaming-related packages like Proton.
        '';
    };

    config = mkIf cfg.steam {

        # ADD STUFF FROM VIMJOYERS VIDEO
        # ADD MORE CONFIGURATION AND OPTIONS (XBOX CONTROLLER?)

        programs.steam = {
            enable = true;
            #remotePlay.openFirewall = true; # Open ports for Steam Remote Play.
            #dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server.
        };
        
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
	            #steam-tui
	            #gamescope
	            #steamtinkerlaunch

	            # Proton
	            protontricks
	            protonup-ng #protonup-qt
	        ;
            inherit (pkgs.steamPackages)
	            #steamcmd
	            #steam-runtime
	            #steam-runtime-wrapped
	        ;
        };
    };
}
