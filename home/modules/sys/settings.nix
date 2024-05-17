{ pkgs, lib, ... }: {

    news.display = "silent";
    nix = {
        package = pkgs.nix;
        settings = {
            warn-dirty = false;
            extra-experimental-features = [ "nix-command" "flakes" ];
            substituters = lib.mkBefore [ "https://cache.nixos.org" ];
            trusted-public-keys = lib.mkBefore [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
        };
    };

    # Fix for nixpkgs.allowUnfree = true
    # https://discourse.nixos.org/t/unfree-packages-on-flake-based-home-manager/30231
    nixpkgs.config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
    };
}
