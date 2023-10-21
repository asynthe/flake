{
  config,
  pkgs,
  ...
}: {

  # Don't suspend/hibernate when closing laptop lid
  # Options: ignore, poweroff, reboot, halt, kexec, suspend, hibernate, hybrid-sleep, suspend-then-hibernate, lock.
  services.logind.lidSwitch = "suspend"; # or
  #services.logind.extraConfig = "HandleLidSwitch=ignore";

  # BOOTLOADER
  boot.supportedFilesystems = [
      "ext4"
      "f2fs"
      #"bcachefs"
      "btrfs"
      "xfs"
      "zfs"
  ];

  # ENCRYPT.NIX, ZFS_ENCRYPTED.NIX (?)
  #boot.initrd.luks.devices = {
    #crypt = {
      #device = "/dev/disk/by-uuid/2fd0b0d6-7c7f-461d-8ba6-d6aa6d3a2401";
      #preLVM = true;
    #};
  #};

  #boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/eb79a748-75bc-41d6-9b74-df1726965260";
  #boot.initrd.luks.devices."crypt".preLVM = true;
  #boot.initrd.availableKernelModules = ["aesni_intel" "cryptd"];
  #boot.initrd.cryptoModules = [ "aes" "aes_generic" "blowfish" "twofish" "serpent" "cbc" "xts" "lrw" "sha1" "sha256" "sha512" "af_alg" "algif_skcipher" ];

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      efibootmgr
      ;
  };
}
