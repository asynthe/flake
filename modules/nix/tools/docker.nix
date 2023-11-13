{ config, pkgs, username, ... }: {

  virtualisation.docker.enable = true;

  # Beware that docker group membership is equivalent to being root!
  # See more at https://github.com/moby/moby/issues/9976
  # See also Rootless mode (below).

  users.users.${username}.extraGroups = [ "docker" ]; # Or next option 
  # users.extraGroups.docker.members = [ "${username}" ];
  # If still unable to get access to socket, re-login.

  #virtualisation.docker.rootless = { # Rootless mode
    #enable = true;
    #setSocketVariable = true;
  #};

}
