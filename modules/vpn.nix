{
    # Tailscale
    services.tailscale.enable = true;

    # Mullvad as a package
    #environment.systemPackages = builtins.attrValues {
        #inherit (pkgs)
            #mullvad # CLI
            #mullvad-vpn # GUI
        #;
    #};

    # Mullvad as a service
    #services.mullvad-vpn.enable = true;
    #networking = {
        #iproute2.enable = true;
        #firewall.checkReversePath = "loose";
        #wireguard.enable = true;
    #};
}
