{
    meta = {
        # -------------- Main settings --------------
        disk.device = "/dev/vda";
        disk.filesystem = "btrfs"; # bcachefs, btrfs, ext4, xfs, zfs
        disk.ssd = true;
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
