{ config, ... }: {

    imports = [

	./modules/boot.nix
	./modules/network.nix
        ./modules/pkgs.nix
	./modules/qbittorrent.nix
	./modules/settings.nix
	./modules/user.nix

    ];
}
