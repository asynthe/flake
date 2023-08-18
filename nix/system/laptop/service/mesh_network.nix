{ config, pkgs, ... }:

{

 # TAILSCALE
  services = {
    tailscale = {
      enable = true;
      #port = ; # From 0 to 65535, default 41641
      #package = with pkgs; [ tailscale ];
      #useRoutingFeatures = #"client" #"server" #"both"
    };
    # Open source coordination server for Tailscale
    headscale = {
      enable = true;
    };
  };

  # ZERO TIER ONE
  services.zerotierone = {
    enable = true;
    #port = ; from 0 to 65535, default 9993
    #package = ;
    joinNetworks = [ "363c67c55a738f47" ];
  };

}
