{ config, pkgs, ... }: {

  users.users.ben = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "にゃ！";
    initialPassword = "pw123";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
  };

  programs.zsh.enable = true; # Required by users.users.<name>.shell
}
