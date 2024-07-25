{ config, lib, pkgs, ... }: 
with lib; with types;
let
    cfg = config.framework.services.locate;
in {
    options.framework.services.locate.enable = mkOption {
        type = bool;
        default = false;
        description = ''
          Enable and set up Locate daemon. (plocate)
        '';
    };

    config = mkIf cfg.enable {

        # Make `output` path an custom option.

        services.locate = {
            enable = true;
            package = pkgs.plocate;
            interval = "hourly"; # updates by default at 2:15 AM every day.
            #localuser = null;
            #output = "/var/cache/locatedb" # The database file to build.
        };
    };
}
