{ config, lib, pkgs, ... }: {

  security.sudo.wheelNeedsPassword = false;

  users.users.ben = {
    #uid = 1000; # Expected by wslg. # Default?
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "にゃ！";
    initialPassword = "pw123";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
  };
  programs.zsh.enable = true; # Required by users.users.<name>.shell
}
