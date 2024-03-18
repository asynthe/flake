{ config, pkgs, ... }: {

    nix.settings.warn-dirty = false;
    nixpkgs.config = {
        allowUnfree = true;
	allowUnfreePredicate = _: true; # Fix for `allowUnfree` not working.
    };
}
