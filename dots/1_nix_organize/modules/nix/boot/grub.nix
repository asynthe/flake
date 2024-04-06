{ config, pkgs, ... }: {

  # Plymouth boot splash screen
  #boot.plymouth.enable = true;

  grub = {
    enable = true
    configurationLimit = 5;
    device = "nodev"; # If only EFI needed.
    efiSupport = true;
    #enableCryptodisk = true; # encryption.nix?

    # Custom GRUB Theme Test
    # NOT WORKING
    #extraConfig = "set theme=${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze/theme.txt";
    #spashImage = null;
  };

  loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

}
