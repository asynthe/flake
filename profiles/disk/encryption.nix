{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.disk.encryption;
in {
    options.meta.disk.encryption = {
        enable = {
            type = bool;
            default = false;
            description = "Enable LUKS encryption.";
        };

        device_name = {
            type = str;
            default = "encrypted";
            description = "Name of the /dev/mapper device.";
        };

        message = {
            type = nullOr str;
            default = null;
            description = "Enable a message when using LUKS encryption.";
        };
    };

    config = mkIf cfg.enable {
        boot.initrd.luks.devices.${cfg.device_name}.preLVM = mkIf (cfg.message != null) true;
    };

    imports = mkIf cfg.enable [

        # Filesystem replace for luks version
        (if cfg.filesystem == "btrfs" then mkForce ./luks/btrfs.nix
        else if cfg.filesystem == "bcachefs" then mkForce ./luks/bcachefs.nix
        else if cfg.filesystem == "ext4" then mkForce ./luks/ext4.nix
        else if cfg.filesystem == "xfs" then mkForce ./luks/xfs.nix
        else if cfg.filesystem == "zfs" then mkForce ./luks/zfs.nix
        else throw "The filesystem specified is incorrect.")

        # Message
        (if cfg.banner == "cat" then ../../banner/luks/cat.nix
        else if cfg.banner == "dice" then ../../banner/luks/dice.nix
        else throw "Specified message is not on the options list.")
    ];
}
