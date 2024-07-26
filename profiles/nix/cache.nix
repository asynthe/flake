{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.system.nix;
in {
    options.meta.system.nix.cache = mkOption {
        type = bool;
        default = true;
        description = "Enable NixOS cache and substituters.";
    };

    config = mkIf cfg.cache {
        nix.settings = {
            substituters = mkBefore [ "https://cache.nixos.org" ];
            trusted-public-keys = mkBefore [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
        };
    };
}
