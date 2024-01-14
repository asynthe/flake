{ config, pkgs, username, ... }: {

  # Beware that docker group membership is equivalent to being root!
  # See more at https://github.com/moby/moby/issues/9976
  # See also Rootless mode (below).

  users.users.${username}.extraGroups = [ "docker" ]; # Or next option 
  # users.extraGroups.docker.members = [ "${username}" ];
  # If still unable to get access to socket, re-login.

  virtualisation.docker = {
    enable = true;

    # Rootless mode
    #rootless = { 
      #enable = true;
      #setSocketVariable = true;
    #};
  };

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs) 
      docker-compose;
  };
}
