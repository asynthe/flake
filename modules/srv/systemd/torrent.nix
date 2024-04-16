{ config, pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    #aria #ariang
	    #qbittorrent #qbittorrent-nox
	    #radarr #lidarr #sonarr
	;
    };
}
