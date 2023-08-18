{ config, pkgs, ... }:

{

  # Networking configuration
  networking = {
    hostName = "genkai";

    #networking.wireless.enable = true; # wpa-supplicant
    # Network Manager
    networkmanager = {
      enable = true;
      ethernet.macAddress = "random";
      wifi = {
        scanRandMacAddress = true;
        macAddress = "random"; # one of: permanent, preserve, random, stable.
        };
      };
  };

  systemd.services.NetworkManager-wait-online.enable = false; # Temporary fix for bug
  services.dnsmasq.enable = true;

}
