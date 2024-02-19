{ config, pkgs, ... }: {

  users.users.ben = {
    isNormalUser = true;
    description = "にゃ！";
    initialPassword = "pw123";
    extraGroups = [ "audio" "networkmanager" "wheel" ];
    packages = with pkgs; [
      direnv
      eza
      starship
      ueberzugpp
      fzf skim
      zoxide
      unimatrix
    ];
  };

  # ZSH
  #users.users.ben.shell = pkgs.zsh;
  #programs.zsh.enable = true; # Required by users.users.<name>.shell
}
