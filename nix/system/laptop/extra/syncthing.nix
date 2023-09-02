{
  config,
  pkgs,
  ...
}: {
  services.syncthing = {
    enable = true;
    #systemService = true;
    #package = ;
    #group = ""; The group to run Syncthing under, by default 'syncthing'.
    #extraFlakgs = ;
    #devices = ;
    #dataDir = "";
    ### SHARED FOLDERS ###
    #folders = ;

    ### RELAY ###
    #relay = {
    #enable = true;
    #port = ; From 0 to 65535, default 22067. Needs to be added to networking.firewall.allowedTCPPorts

    #};
  };
}
