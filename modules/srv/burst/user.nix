{ user, ... }: {
    users.users = {
        root.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com" ];     
        ${user} = {
	        description = "User";
            initialPassword = "meows123";
            isNormalUser = true;
	        extraGroups = [ "networkmanager" "wheel" "shared" ];
            openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIY8tUQ59AvWkt0pTSMz2bf3O7emcO37IaA8vZCnXisk bendunstan@protonmail.com" ];
	    };
    };
}
