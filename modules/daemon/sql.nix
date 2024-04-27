{ config, pkgs, ... }: {

    services.httpd = {
	enable = true;
	enablePHP = true;
	adminAddr = "webmaster@example.org";
	virtualHosts."html" = {
	    documentRoot = "/var/www/html";
	};
    };

    systemd.tmpfiles.rules = [
	"d /var/www/html"
	"f /var/www/html/index.php - - - - <?php phpinfo();"
    ];

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
