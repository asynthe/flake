{
  config,
  username,
  pkgs,
  ...
}: {

  # Just the package and set up myself.
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      syncthing
      syncthingtray
      #stc-cli
      ;
  };

  # Enable and configure.
  #services.syncthing = {
    #enable = true;
    #systemService = true; # Run as system service.
    #user = "${username}";
    #package = ;
    #group = ""; The group to run Syncthing under, by default 'syncthing'.
    #extraFlakgs = ;
    #devices = ;
    #dataDir = "";
    ### SHARED FOLDERS ###
    #folders = ;

  #};
  #services.syncthing.relay = {
   #enable = true;
   #port = ; From 0 to 65535, default 22067. Needs to be added to networking.firewall.allowedTCPPorts
  #};
}
