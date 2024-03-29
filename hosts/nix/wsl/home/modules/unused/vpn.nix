{ config, pkgs, ... }: {

  # Tailscale
  services.tailscale.enable = true;

  # Mullvad acts weird
  # While it works, it won't let you *not* use it (as a service)
  # And the package will not work.
  # I've seen some tips, and I guess I'll try later in the future.
  # For now I want to try Tailscale's mullvad service instead.

  # Mullvad as a package
  #environment.systemPackages = builtins.attrValues {
    #inherit (pkgs)
    #mullvad # CLI
    #mullvad-vpn # GUI
    #mullvad-closest
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
