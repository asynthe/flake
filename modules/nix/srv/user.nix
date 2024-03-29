{ config, pkgs, ... }: {

    users.users.server = {
        isNormalUser = true;
	description = "Asynthe/missingno's server configuration.";
	initialPassword = "pw123"; # CHANGE
	extraGroups = [ "audio" "networkmanager" "wheel" ];
    };
}
