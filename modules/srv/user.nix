{ config, user, ... }: {

    sops.secrets = {
        "password/server/data".neededForUsers = true;
        "password/server/root".neededForUsers = true;
        "password/server/user".neededForUsers = true;
        "ssh/public/thinkpad".neededForUsers = true;
    };

    users.mutableUsers = false; # Required for passwords set by sops.
    users.users = {
        data = {
	        description = "User that can modify data";
            isNormalUser = true;
	        hashedPasswordFile = config.sops.secrets."password/server/data".path;
	        extraGroups = [ "networkmanager" "wheel" "shared" ];
	    };

        ${user} = {
            home = "/home/data";
            createHome = false;
	        description = "User with access-only";
            isNormalUser = true;
	        extraGroups = [ "networkmanager" "wheel" "shared" ];
	        hashedPasswordFile = config.sops.secrets."password/server/user".path;
	    };

	    root = {
	        hashedPasswordFile = config.sops.secrets."password/server/root".path;
            openssh.authorizedKeys.keyFiles = [ config.sops.secrets."ssh/public/thinkpad".path ];
        };
    };
}
