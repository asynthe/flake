{ config, pkgs, username, sops-nix, ... }: {

    sops.secrets."password/server".neededForUsers = true;
    users.mutableUsers = false; # Required for passwords set by sops.

    users.users = {
        ${username} = {
            isNormalUser = true;
	    description = "Asynthe/missingno's server configuration";
	    hashedPasswordFile = config.sops.secrets."password/server".path;
	    extraGroups = [ "audio" "networkmanager" "wheel" ];
	};
	root.openssh.authorizedKeys.keys = [ config.sops.secrets."private_key/thinkpad".path ];
    };
}
