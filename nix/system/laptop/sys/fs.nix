{
  config,
  pkgs,
  ...
}: {
  boot.supportedFilesystems = ["zfs"];
  networking.hostId = "3a864bd3"; # Random 8 digits, required
  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages; # Only latest compatible kernel stuff with ZFS.
  services.zfs = {
    trim.enable = true;
    autoScrub = {
      enable = true;
      pools = ["nixpool"];
    };
  };

  # Filesystem Partitions
  fileSystems = {
    "/" = {
      device = "nixpool/root/nixos";
      fsType = "zfs";
    };
    "/home" = {
      device = "nixpool/home";
      fsType = "zfs";
    };
  };
  #boot.kernelParams = [ "nohibernate" ]; # Hibernation

  # Filesystem tools
  environment.systemPackages = with pkgs; [
    # Tools
    nvme-cli
    hdparm

    # Backup Tools
    sanoid # ZFS
    borgbackup
    restic
    tarsnap

    # Progs
    xfsprogs
    btrfs-progs
    ntfs3g
  ];
}
