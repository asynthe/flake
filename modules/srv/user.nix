{ user, ... }: {

    users.users = {
	    root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com" ];
        data = {
	        description = "User that can modify data";
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
}
