{ config, pkgs, username, ... }: {

  # Test with Nix and Home

  # NIX
  # Xbox one controller drivers
  hardware.xone.enable = true; # Xbox one controller driver.
  hardware.xpadneo.enable = true; # Xbox one controller bluetooth driver.

  # Gamemode - better performance on games. Use with gamemoderun.
  #users.users.${username}.extraGroups = [ "gamemode" ];
  #programs.gamemode = {
  #enable = true;
  #enableRenice = true;
  #settings = ;
  #};

  # HOME
  # --- USER ADD TO GAMEMODE GROUP CONFIG ---
  #home.packages = builtins.attrValues {
    #inherit (pkgs)
      #gamemode
      #xpadneo
      #;
  #};
}
