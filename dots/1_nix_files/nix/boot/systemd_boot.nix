{ config, pkgs, ... }: {

  boot.loader = {
    timeout = 5;
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    #efi = {
      #canTouchEfiVariables = true;
      #efiSysMountPoint = "/boot";
    #};
  };
}
