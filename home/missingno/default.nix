{ config, ... }: {

    nix.settings.warn-dirty = false;
    nixpkgs.config = {
        allowUnfreePredicate = _: true;
	allowUnfree = true;
    };

    imports = [

        ./home.nix
        ./modules.nix

    ];
}
