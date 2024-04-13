{ config, pkgs, username, sops-nix, ... }: {

    sops.secrets."password/server".neededForUsers = true;
    users.mutableUsers = false; # Required for passwords set by sops.

    users.users.testing = {
        isNormalUser = true;
	initialPassword = "meow123";
	extraGroups = [ "wheel" ];
    };

    users.users = {
        ${username} = {
            isNormalUser = true;
	    description = "Asynthe/missingno's server configuration";
	    hashedPasswordFile = config.sops.secrets."password/server".path;
	    extraGroups = [ "audio" "networkmanager" "wheel" ];
	};
	root.openssh.authorizedKeys.keys = [ # SECRET
	    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com"
        ];
    };
}
