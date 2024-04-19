{ config, ... }: {

    networking.hostName = "server";
    system.stateVersion = "23.11";
    nixpkgs.config.allowUnfree = true;
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Australia/Perth";

    imports = [

        ./modules.nix
	./hardware.nix

    ];
}
