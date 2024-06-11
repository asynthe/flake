{ config, pkgs, ... }: {

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
}
