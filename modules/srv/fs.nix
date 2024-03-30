{ config, pkgs, ... }: {

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
	    ntfs3g;
    };
}
