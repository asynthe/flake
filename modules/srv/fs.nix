{ config, pkgs-stable, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs-stable)
	    ntfs3g;
    };
}
