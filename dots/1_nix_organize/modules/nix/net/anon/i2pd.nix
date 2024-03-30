{ config, ... }: {

  # i2pd configuration, using defaults from here
  # https://i2phides.me/i2pd-docs/user-guide/configuration/index.html

  # Outbound NAT rule must be created.
  # https://forum.opnsense.org/index.php?topic=15924.0

  #networking.nat.forwardPorts = [{
    #destination = "10.0.0.1:35467";
    #proto = "tcp";
    #sourcePort = 8080;
  #}];

  #networking.firewall = {
    #enable = true;
    #interfaces = {
      #"wg-mullvad".allowedTCPPorts = [ 80 443 29988 ];
      #"wlp3s0".allowedTCPPorts = [ 80 443 29988 ];
    #};
  #};

  # W NAT
  #networking.nat.forwardPorts

  # WO NAT
  #networking.firewall = {
    #extraCommands = "iptables -I FORWARD ...";
    #extraStopCommands = "iptables -D FORWARD ... || true";
  #};

  services.i2pd = {
    enable = true;
    bandwidth = 500; # i2pd defaults to 32kbps.
    dataDir = "/home/asynthe/i2p";
    logLevel = "info"; # debug, info, warn, error
    netid = 2;

    nat = true; # Bypass NAT.
    port = 29988;
    #ifname = "wg-mullvad"; # Network interface to bind to.
    enableIPv4 = true;

    #ifname4 = ; # IPv4 interface to bind to.
    #enableIPv6 = true;
    #ifname6 = ; # IPv6 interface to bind to.
    ssu = true;

    ntcp = true;
    #ntcpProxy = ; # Proxy URL for NTCP transport.
    ntcp2 = {
      enable = true;
      #port = ;
      published = true;
    };

    # UPNP
    upnp = {
      enable = true; # false by default for CLI, true for GUI. (Windows, Android)
      name = "I2Pd";
    };

    proto = {

      # HTTP webconsole
      http = {
        enable = true;
	address = "127.0.0.1"; # Bind address.
	port = 7070;
	hostname = "localhost";
	#auth = true; # Webconsole authentication.
	#user = "i2pd";
	#pass = "i2pd"; # Default: random, see logs.
	strictHeaders = true; # Strict host checking on WebUI.
      };


      ### TESTING - SERVICES - IN ORDER OF WEB CONSOLE ###

      # HTTP proxy
      httpProxy = {
        enable = true;
      };

      # Socks proxy
      socksProxy = {
        enable = true;
      };

      # SAM interface
      sam = {
        enable = true;
	#name = ;
      };

      # BOB interface
      bob = {
        enable = false;
      };

      # I2PControl interface
      i2pControl = {
        enable = false;
      };

      #websocket = {
        #enable = true;
        #name = ;
        #port = ;
      #};
    }; 
  };
}
