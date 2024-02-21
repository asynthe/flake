{ config, ... }: {

  imports = [

    ./hardware-configuration.nix
    ./modules.nix
    ./modules-list.nix # Old list of modules (fix)

  ];

  networking.hostName = "thinkpad";
  system.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Australia/Perth";

}
