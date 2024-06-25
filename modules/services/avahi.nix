{ pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            vlc
        ;
    };

    networking.firewall.allowedTCPPorts = [ 8010 ];
    services.avahi = {
        enable = true;
    };
}
