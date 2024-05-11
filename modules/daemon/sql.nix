{ pkgs, ... }: {

    services.mysql = {
	    enable = true;
	    package = pkgs.mariadb;
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    apacheHttpd
	    pgadmin4
	    pgmanage # Now called postage.
	    dbeaver
	    ;
    };
}
