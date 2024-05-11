{ user, ... }: {

    # Beware that docker group membership is equivalent to being root!
    # See more at https://github.com/moby/moby/issues/9976
    # See also Rootless mode (below).

    users.users.${user}.extraGroups = [ "docker" ];
    virtualisation.docker = {
        enable = true;
        #storageDriver = # mkIf.system.configuration.filesystem = "btrfs" then "btrfs";
        #rootless = { # Rootless mode
            #enable = true;
            #setSocketVariable = true;
        #};
    };
}
