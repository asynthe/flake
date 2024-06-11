{ config, lib, ... }:
with lib;
let
    cfg = config.system.nix.cache;
in {
    options.system.nix.cache = mkOption {
        type = types.bool;
        default = true;
        description = "Enable NixOS cache and substituters.";
    };

    config = mkIf cfg {

        nix.settings = {
            substituters = lib.mkBefore [ "https://cache.nixos.org" ];
            trusted-public-keys = lib.mkBefore [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
        };

        # -------------------------------------------------
        # OTHER, put into specific files
        #nix.settings = {
            #substituters = [
                #"https://nix-community.cachix.org" # Nix community's cache server
                #"https://nixpkgs-wayland.cachix.org"
            #];
            #trusted-public-keys = [
                #"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
	            #"nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
            #];
        #};
    };
}
