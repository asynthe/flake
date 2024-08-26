{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.system;
in {
    options.meta.system.packages = mkOption {
        type = str;
        default = "minimal";
        description = "Set of packages to install by default.";
    };

    imports = [
        ./pkgs/minimal.nix
        ./pkgs/minimal_stable.nix
    ];
}
