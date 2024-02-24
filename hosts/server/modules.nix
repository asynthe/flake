{ config, ... }: {

    imports = [

        ./modules/pkgs.nix
	./modules/qbittorrent.nix
	./modules/network.nix

    ];
}
