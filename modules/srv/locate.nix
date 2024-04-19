{ config, pkgs-stable, ... }: {

    services.locate = {
        enable = true;
        locate = pkgs-stable.plocate;
        interval = "hourly"; # updates by default at 2:15 AM every day.
        #localuser = null;
        #output = "/var/cache/locatedb" # The database file to build.
        #extraFlags = ;
        #prunePaths = ;
        #pruneNames = ;
        #pruneFS = ;
        #pruneBindMounts = ;
    };
}
