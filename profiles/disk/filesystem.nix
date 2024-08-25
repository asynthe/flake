{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.disk;
in {
    options.meta.disk.filesystem = {
        type = nullOr str;
        default = null;
        description = "Filesystem to be used.";
    };

    imports = [
        ./disko/btrfs.nix
    ];

    config = {
        assertions = [
            {
                assertion = cfg.filesystem == null;
                message = "You must specify a filesystem for disko.";
            }
        ];
    };
}
