{ config, pkgs, ... }: {

  # Some configuration
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" "riscv64-linux"];
    supportedFilesystems = [
      #"btrfs"
      "ext4"
      #"f2fs"
      #"vfat"
      "xfs"
      #"fat" # Remove?
      #"exfat" # Remove?
    ];
  };

  # Filesystem tools
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      # Tools
      nvme-cli
      hdparm
      fio

      # Backup Tools
      #borgbackup
      restic
      tarsnap

      ;
  };
}
