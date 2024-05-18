{
    services.tailscale.enable = true;

    #networking.firewall.trustedInterfaces = [ "tailscale0" ];
    # Allow connections through mullvad exit nodes
    #networking.firewall.checkReversePath = "loose"; # ?
}
