{ config, pkgs, ... }: {

# See more at https://nixos.wiki/wiki/Printing

  # Local print service.
  services.printing.enable = true;

  # Autodiscovery of network printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

}
