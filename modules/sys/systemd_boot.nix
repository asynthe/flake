{ config, pkgs, ... }: {

  boot.loader = {
    timeout = 3;
    systemd-boot = {
      enable = true;
      configurationLimit = 7;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
  };
}
