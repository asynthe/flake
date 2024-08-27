{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.meta.gaming;
in {
    options.meta.gaming.steam = mkOption {
        type = bool;
        default = false;
        description = ''
          Enable Steam and gaming-related packages like Proton.
        '';
    };

    config = mkIf cfg.steam {

        # ADD STUFF FROM VIMJOYERS VIDEO
        # ADD MORE CONFIGURATION AND OPTIONS (XBOX CONTROLLER?)

        # -------------- Steam --------------
        programs.steam = {
            enable = true;
            gamescopeSession.enable = true;
            #remotePlay.openFirewall = true; # Open ports for Steam Remote Play.
            #dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server.
        };

        programs.steam.protontricks.enable = true;
        environment.sessionVariables = {
            STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/${config.meta.system.user}/.steam/root/compatibilitytools.d";
        };

        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)

                mangohud
	            protonup-ng # ProtonGE
	            #steam-tui
	            #gamescope
	            #steamtinkerlaunch
	        ;
            inherit (pkgs.steamPackages)
	            #steamcmd
	            #steam-runtime
	            #steam-runtime-wrapped
	        ;
        };
    };
}
