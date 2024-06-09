{ config, pkgs, ... }: {

  # Some configuration
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux"];
    supportedFilesystems = [
      #"bcachefs"
      #"btrfs"
      "ext4"
      #"f2fs"
      #"vfat"
      "xfs"
      #"zfs" # Requires network.hostId.
    ];
  };

  # Filesystem tools
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      # Backup Tools -> #BACKUP.nix ??
      #borgbackup
      #restic
      #tarsnap
      ;
  };
}
