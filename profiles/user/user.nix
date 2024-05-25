{ config, lib, pkgs, user, ... }: 
let
  cfg_laptop = config.system.laptop.users.enable;
  cfg_server = config.system.server.users.enable;
in {
  options.system.laptop.users.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = ''
      Set up the users for the laptop configuration.
    '';
  };
  
  options.system.server.users.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = ''
      Set up the users for the server configuration.
    '';
  };

  config = lib.mkMerge [
    (lib.mkIf cfg_server {
      users.users = {
        root.openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com"
        ];     
        data = {
          description = "User that can modify data";
          initialPassword = "meows123";
          isNormalUser = true;
          extraGroups = [ "networkmanager" "wheel" "shared" ];
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com"
          ];
        };
        server = {
          home = "/home/data";
          createHome = false;
          description = "User with access-only";
          isNormalUser = true;
          extraGroups = [ "networkmanager" "wheel" "shared" ];
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com"
          ];
        };
      };
    })
    (lib.mkIf cfg_laptop {
      sops.secrets."password/thinkpad".neededForUsers = true;
      users.mutableUsers = false; # Required for passwords set by sops.
      users.users.${user} = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "にゃ！";
        hashedPasswordFile = config.sops.secrets."password/thinkpad".path;
        extraGroups = [ "audio" "networkmanager" "input" "wheel" ];
      };
      programs.zsh.enable = true;
      security.sudo.extraConfig = ''
        Defaults timestamp_timeout=120 # Ask for password every 2 hours.
      '';
    })
  ];
}
