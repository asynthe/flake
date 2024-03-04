{ config, ... }: {

    imports = [

	./modules/boot.nix
	./modules/fs.nix
	#./modules/locate.nix
	./modules/network.nix
        ./modules/pkgs.nix
	./modules/qbittorrent.nix
	./modules/settings.nix
	./modules/user.nix
	./modules/xmr.nix

    ];
}
