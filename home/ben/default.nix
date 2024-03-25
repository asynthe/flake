{ config, ... }: {

    #home.configuration.ben.enable = true;

    imports = [
        ./home.nix
	./modules.nix
        #../modules.nix
    ];
}
