{ config, pkgs, ... }:

{ 

  # Configuration
  services.monero = {
    enable = true;
    dataDir = "/home/asynthe/.monero";
    #extraConfig = "example\n" # strings concatenated with "\n"
    #priorityNodes = [ "" ];
    #exclusiveNodes = [ "" ];
    #extraNodes = [ "" ];
    #limits = {
     #download = ""; # Set to -1 to leave unlimited.
     #upload = ""; # Set to -1 to leave unlimited.
     #threads = ""; # Set to 0 to leave unlimited.
     #syncSize = ""; # Set to 0 for adaptative.
    #};
    #rpc = {
      #address = "";
      #port = "";
      #user = "";
      #password = "";
      #restricted = false;
    #};
  };

  # Mining
  #services.monero.mining = {
    #enable = true;
    #threads = ""; # Set to 0 to use all available.
    #mining.address = "";
  #};

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    # Official GUI/CLI
    monero-gui
    monero-cli
    # Mining
    #xmrig #xmrig-proxy
    #p2pool
    #xmr-stak
  ];

}
