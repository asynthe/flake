{ config, pkgs, ... }: {

    nix = {
        package = pkgs.nix;
        settings = {
            warn-dirty = false;
            extra-experimental-features = [ "nix-command" "flakes" ];
        };
    };

    # Fix for nixpkgs.allowUnfree = true
    # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };
}
