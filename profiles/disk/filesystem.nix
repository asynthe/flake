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


    imports = [
        (if cfg.filesystem == "btrfs" then ./disko/btrfs.nix
        else if cfg.filesystem == "bcachefs" then ./disko/bcachefs.nix
        else if cfg.filesystem == "ext4" then ./disko/ext4.nix
        else if cfg.filesystem == "xfs" then ./disko/xfs.nix
        else if cfg.filesystem == "zfs" then ./disko/zfs.nix
        else throw "The filesystem specified is incorrect.")
    ];

    #imports = mkIf (cfg.filesystem == "btrfs") [
        #./disko/btrfs.nix
    #];

    #imports = [
        #(if cfg.filesystem == null then throw "Please specify a filesystem."
        #else if cfg.filesystem == "btrfs" then ./disko/btrfs.nix)
        #else throw "The filesystem specified is incorrect.")
    #];
}
