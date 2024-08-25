{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.disk;
in {
    options.meta.disk.filesystem = {
        type = str;
        default = "btrfs";
        description = "Filesystem to be used.";
    };

    config = { };

    imports = [
        ./disko/btrfs.nix
    ];
}
