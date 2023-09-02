{
  config,
  pkgs,
  ...
}: {
  # LOCATE
  services.locate = {
    enable = true;
    locate = pkgs.plocate;
    localuser = null;
    interval = "hourly"; # updates by default at 2:15 AM every day.
    #output = "/var/cache/locatedb" # The database file to build.
    #extraFlags = ;
    #prunePaths = ;
    #pruneNames = ;
    #pruneFS = ;
    #pruneBindMounts = ;
  };
}
