{ config, pkgs, username, ... }:

{

  # USER
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [ "docker" "wheel" "video" "audio" "networkmanager" "lp" "scanner" ];
    shell = pkgs.zsh;
    initialPassword = "password";
    #openssh.authorizedKeys.keys = [
      #""
    #];
    #packages = with pkgs; [
    #];
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      source-code-pro
      font-awesome
      iosevka-comfy.comfy
      corefonts
      nerdfonts
      # Japanese
      ipafont
      kochi-substitute
      ];
    fontconfig.defaultFonts = {
      monospace = [ "DejaVu Sans Mono" "IPAGothic" ];
      sansSerif = [ "DejaVu Sans" "IPAPGothic" ];
      serif = [ "DejaVu Serif" "IPAPMincho" ];
      };
  };

}
