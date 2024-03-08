{ config, ... }: {

  # Steam
  programs.steam = {
    enable = true;
    #remotePlay.openFirewall = true; # Open ports for Steam Remote Play.
    #dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server.
  };

  # Already enabled with programs.steam.enable = true;
  #hardware.steam-hardware.enable = true; 

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    # Steam
	    #steam-tui
	    #gamescope
	    #steamtinkerlaunch

	    # Proton
	    protontricks
	    protonup-ng #protonup-qt
	;
	inherit (pkgs.steamPackages)
	    steamcmd
	    #steam-runtime
	    #steam-runtime-wrapped
	;
    };
}
