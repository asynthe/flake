{ config, inputs, pkgs, user, ... }: {

    wsl = {
        enable = true;
	defaultUser = "nixos";
	startMenuLaunchers = true;
	#wslConf = {
	    #automount.root = "/home/${user}/win";
	    #boot.command = "";
	#};
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    home-manager
	;
    };
}
