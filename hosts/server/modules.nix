{ config, ... }: {

    imports = [

	./modules/network.nix
        ./modules/pkgs.nix
	./modules/qbittorrent.nix
	./modules/settings.nix
	./modules/user.nix

    ];
}
