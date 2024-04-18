{ config, pkgs, user, ... }: {

    # Beware that docker group membership is equivalent to being root!
    # See more at https://github.com/moby/moby/issues/9976
    # See also Rootless mode (below).

    users.users.${user}.extraGroups = [ "docker" ]; # Or next option 
    # users.extraGroups.docker.members = [ "${username}" ];
    # If still unable to get access to socket, re-login.

    virtualisation.docker.enable = true;
    # virtualisation.docker.storageDriver = # mkIf.system.configuration.filesystem = "btrfs" then "btrfs";
    #virtualisation.docker.rootless = { # Rootless mode
        #enable = true;
        #setSocketVariable = true;
    #};

    #environment.systemPackages = builtins.attrValues {
        #inherit (pkgs) 
            #docker-compose
	#;
    #};
}
