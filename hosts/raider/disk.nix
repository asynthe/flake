{
    /*
    meta.system.persistent = true;
    meta.system.diskconfig = "btrfs" # btrfs, zfs,

    If persisten is set and btrfs is chosen,
    persistence configuration is enabled on btrfs.
    Configurations 

    btrfs - regular 100% one partition
    btrfs - persistence without encryption
    btrfs - persistence with encryption

    If `disk.encryption` is enabled:
    Instead of pointing to ../../profiles/disk/disko/<filesystem>.nix
    It will instead point to ../../profiles/disk/luks/<filesystem>.nix

    Note: 
    We have two disko configurations, the regular and luks
    If encryption is enabled, then the luks configurations uses a mkForce
    If `disk.filesystem = "btrfs` then a mkForce should be used
    */

    imports = [
        ../../profiles/disk/disko/btrfs.nix
    ];

    meta = {
        # -------------- Main settings --------------
        disk.device = "/dev/vda";
        #disk.filesystem = "btrfs"; # bcachefs, btrfs, ext4, xfs, zfs
        #disk.ssd = true;
        #disk.swap.size = "14G";

        # -------------- Persistence --------------
        disk.persistence.enable = true;
        #disk.persistence.type = "tmpfs"; # snapshots (btrfs) or tmpfs

        # -------------- Encryption (luks) --------------
        disk.encryption.enable = true;
        #disk.encryption.message = "cat"; # cat, dice...
        #disk.encryption.device_name = "encrypted";
    };
}
