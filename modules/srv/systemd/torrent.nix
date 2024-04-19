{ config, pkgs-stable, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs-stable)
	    #aria #ariang
	    #qbittorrent #qbittorrent-nox
	    #radarr #lidarr #sonarr
	;
    };
}
