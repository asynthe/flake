{ config, user, sops-nix, ... }: {

    sops.secrets = {
        "password/server/data".neededForUsers = true;
        "password/server/root".neededForUsers = true;
        "password/server/user".neededForUsers = true;
    };

    fileSystems."/home/data".options = "defaults";
    #fileSystems."/home/data".options = "mode=0750";

    users = {
        mutableUsers = false; # Required for passwords set by sops.
        data = {
	        description = "User that can modify data";
            isNormalUser = true;
	        hashedPasswordFile = config.sops.secrets."password/server/data".path;
	        extraGroups = [ "networkmanager" "wheel" "shared" ];
	    };

        ${user} = {
            home = "/home/data";
	        description = "User with access-only";
            isNormalUser = true;
	        extraGroups = [ "networkmanager" "wheel" "shared" ];
	        hashedPasswordFile = config.sops.secrets."password/server/user".path;
	    };

	    root = {
	        hashedPasswordFile = config.sops.secrets."password/server/root".path;
            openssh.authorizedKeys.keys = [ # SECRET
	            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com"
            ];
        };
    };
}
