{ config, pkgs, username, ... }:

{

  # Enable adb
  programs.adb.enable = true;

  # Add user to adbusers group
  users.users.${username}.extraGroups = [ "adbusers" ];

  # scrcpy and other packages
  environment.systemPackages = with pkgs; [
    scrcpy
  ];

}
