{ config, pkgs, lib, ... }: {

    #sops.secrets.mullvadAccount = {
        #sopsFile = ./secrets.yaml;
        #path = "/etc/mullvad-vpn/account-history.json";
    #};

    # Tailscale
    services.tailscale.enable = true;
    networking.firewall = {
        trustedInterfaces = [ "tailscale0" ];
        checkReversePath = "loose"; # TEST - Allow connections through mullvad exit nodes
    };

    services.mullvad-vpn = {
        enable = true;
        # pkgs.mullvad only provides the CLI tool.
        # pkgs.mullvad-vpn provices both CLI and GUI.
        package = pkgs.mullvad-vpn;
    };

    # Mullvad configuration
    #systemd.services."mullvad-daemon".postStart = 
    #let
        #mullvad = "${config.services.mullvad-vpn.package}/bin/mullvad";
        #location = "au-mel-wg-301";
    #in ''
#while ! ${mullvad} status >/dev/null; do sleep 1; done
#${mullvad} lan set allow
#${mullvad} auto-connect set on
#${mullvad} lockdown-mode set on
#${mullvad} relay set location ${location}
    #'';
#${if config.services.tailscale.enable then ''
#${mullvad} split-tunnel add $(pgrep tailscaled) 
#'' else ""}

    #networking.nftables = lib.mkIf config.services.tailscale.enable {
        #enable = true;

        # Mullvad and Tailscale will fight to the death over routing rules (and
        # Mullvad will win) unless we set exceptions for Tailscale. Issue link:
        # https://github.com/tailscale/tailscale/issues/925#issuecomment-1616354736.
        #tables."mullvad-tailscale" = {
            #family = "inet";
            #content = ''
#chain prerouting {
  #type filter hook prerouting priority -100; policy accept;
  #ip saddr 100.64.0.0/10 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
#}

#chain outgoing {
  #type route hook output priority -100; policy accept;
  #meta mark 0x80000 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
  #ip daddr 100.64.0.0/10 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
#}
            #'';
        #};
    #};
}
