{ config, pkgs, ... }: {

    networking = {
       networkmanager.enable = true; # NetworkManager.
       #wireless.enable = true; # wpa_supplicant.
       firewall.enable = false;
    };

    # SSH
    services.openssh = {
        enable = true;
        allowSFTP = true;
    };
}
