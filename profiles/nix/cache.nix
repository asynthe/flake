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
            substituters = mkBefore [ "https://cache.nixos.org" ];
            trusted-public-keys = mkBefore [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
        };
    };
}
