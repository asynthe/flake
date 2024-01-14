{ config, pkgs, username, ... }: {

  # Enable adb
  programs.adb.enable = true;

  # Add user to adbusers group
  users.users.${username}.extraGroups = ["adbusers"];

  # List of packages
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      scrcpy
      ;
  };
}
