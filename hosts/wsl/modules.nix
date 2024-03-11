{ config, ... }: {

    imports = [

        ./modules/pkgs.nix
	./modules/python.nix
        ./modules/settings.nix
        ./modules/sys.nix
        ./modules/user.nix

    ];
}
