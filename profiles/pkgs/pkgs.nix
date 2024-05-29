{ config, lib, pkgs, user, ... }: 

with lib;
let
    cfg_pkgs = config.system.pkgs;
in {
    options.system.pkgs = mkOption {
        type = types.string;
        default = "minimal";
        description = ''


        '';
    };

    config = mkMerge [
        (mkIf (cfg_pkgs == "minimal" ) {
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
        (mkIf (cfg_server.enable) {
            users.users = {
	            root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com" ];     
                data = {
	                description = "User that can modify data";
                    initialPassword = "meows123";
                    isNormalUser = true;
	                extraGroups = [ "networkmanager" "wheel" "shared" ];
                    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com" ];
	            };
                ${user} = {
                    home = "/home/data";
                    createHome = false;
	                description = "User with access-only";
                    isNormalUser = true;
	                extraGroups = [ "networkmanager" "wheel" "shared" ];
                    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com" ];
	            };
            };
        })
    ]; 
}
