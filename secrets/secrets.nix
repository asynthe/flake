{ config, inputs, pkgs, username, ... }: {

  imports = [ inputs.sops-nix.nixosModules.sops ];

  # Packages needed (if not using nix shell)
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      age
      sops
      ssh-to-age
      ssh-to-pgp
      ;
  };

  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    secrets = {

      example-key = {
        owner = username;
      };

      "myservice/my_subdir/my_secret" = {
        owner = username;
      };

      "password/user/asynthe" = {
        owner = username;
      };

      "tailscale/personal_network" = {
        owner = username;
      };

    };
  };

  # Add SSH Keys here converted to sops-nix
  #services.zerotierone.joinNetworks = [ "e3918dbb4836ec1ae" ];

  # Converting to sops-nix
  #services.zerotierone.joinNetworks = [ "${config.sops.secrets."tailscale.personal_network"}" ];

  # User passwords
  #users.users.asynthe.password = config.sops.secrets."password/user/asynthe".path;

  # FOR LATER
  #networking.wireless.networks = {
    # Phobos
    #"${wifi_networks/home/phobos}".psk = "${wifi_networks/home/phobos_password}";
    # NETGEAR
    #...
    # Phone
    #...
  #};

}
