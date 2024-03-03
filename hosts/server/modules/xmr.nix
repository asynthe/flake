{ config, pkgs, ... }: {

  #services.monero = {
    #enable = true;
    #dataDir = "/home/asynthe/.monero";
    #priorityNodes = [ "" ];
    #exclusiveNodes = [ "" ];
    #extraNodes = [ "" ];
    #extraConfig = "example\n" # strings concatenated with "\n"
    #limits = {
      #download = "-1"; # Set to -1 to leave unlimited.
      #upload = ""; # Set to -1 to leave unlimited.
      #threads = "0"; # Set to 0 to leave unlimited.
      #syncSize = "0"; # Set to 0 for adaptative.
    #};
    #rpc = {
      #address = "";
      #port = "";
      #user = "";
      #password = "";
      #restricted = false;
    #};
  #};

  # Mining
  #services.monero.mining = {
    #enable = true;
    #threads = ""; # Set to 0 to use all available.
    #mining.address = "";
  #};

  # Install necessary packages
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      monero-gui
      monero-cli

      # Mining
      #xmrig #xmrig-proxy
      #p2pool      
      #xmr-stak
      ;
  };
}
