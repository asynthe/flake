{ config, lib, ... }: 
with lib;
let
    cfg = config.framework.services.docker;
in {
    options.framework.services.docker.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up Docker.
        '';
    };

    config = mkIf cfg.enable {

        # Beware that docker group membership is equivalent to being root!
        # See more at https://github.com/moby/moby/issues/9976
        # See also Rootless mode (below).

        users.users.${config.framework.system.user}.extraGroups = [ "docker" ];
        virtualisation.docker = {
            enable = true;
            #storageDriver = # mkIf.system.configuration.filesystem = "btrfs" then "btrfs";
            #rootless = { # Rootless mode
                #enable = true;
                #setSocketVariable = true;
            #};
        };

        # ADD options for podman
        #virtualisation.podman = {
            #enable = true;
            #dockerCompat = true; # `docker` alias for podman.
            #defaultNetwork.settings.dns_enabled = true; # Required so podman-composed containers to be able to talk to each other.
        #};
    };
}
