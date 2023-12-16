{ config, pkgs, ... }: {

  # MOVE THIS TO ZFS
  # Something in my config is getting zfs, making me require this, even though im using F2FS.
  #networking.hostId = "3a864bd3"; # Random 8 digits, required

  #boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages; # Only latest compatible kernel stuff with ZFS.

  #services.zfs = {
    #trim.enable = true;
    #autoScrub = {
      #enable = true;
      #pools = ["nixpool"];
    #};
  #};

  # Partitions
  #fileSystems = {
    #"/" = {
      #device = "nixpool/root/nixos";
      #fsType = "zfs";
    #};
    #"/home" = {
      #device = "nixpool/home";
      #fsType = "zfs";
    #};
  #};

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      sanoid
      ;
  };

}
