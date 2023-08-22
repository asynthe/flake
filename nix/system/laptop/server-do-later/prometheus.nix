{ config, pkgs, ... }:

{

  services.prometheus = {
    enable = true;
    #package = ;
    #alertmanager.enable = true;
    #enableReload = true;
    #pushgateway.enable = true;
    #exporters = {
      #zfs.enable = true;
      #systemd.enable = true;
      #tor.enable = true;
      #sql.enable = true;
      #nginx.enable = true;
      #};
    #configText = [;
    #webExteralUrl = [;
  };
  
}
