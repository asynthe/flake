{ config, pkgs, ... }: {

  virtualisation.podman = {
    enable = true;

    # `docker` alias for podman, to use it as drop-in replacement.
    #dockerCompat = true;

    # Required for containers under podman-composed to be able to talk to each other.
    defaultNetwork.settings.dns_enabled = true;
  };

}
