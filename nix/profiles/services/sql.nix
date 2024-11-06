{ config, lib, pkgs, ... }:
with lib; with types;
let
    cfg = config.meta.services.sql;
in {
    options.meta.services.sql.enable = mkOption {
        type = bool;
        default = false;
        description = ''
          Enable and set up an SQL Server and editors.
        '';
    };

    config = mkIf cfg.enable {

        # ADD LIST OF MULTIPLE BACKENDS
        # services.sql = [ "mysql" "postgresql" ];

        services.mysql = {
	        enable = true;
	        package = pkgs.mariadb;
        };

        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
	            pgadmin4
	            pgmanage # Now called postage.
	            dbeaver
	        ;
        };
    };
}
