{ config, pkgs, username, ... }: {

  imports = [
    ./env.nix
    ./fonts.nix
    ./pkgs.nix
  ];

  # User
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormlalUser = true;
    description = "${username}";
    extraGroups = ["docker" "wheel" "video" "audio" "networkmanager" "lp" "scanner" "input"];
    initialPassword = "password";
  };
  programs.zsh.enable = true; # Needed by users.users.${username}.shell


  # Replace sudo with doas
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["${username}"];
          keepEnv = true;
          #persist = true; # No auth every 5 mins.
          noPass = true; # No auth.
        }
      ];
    };
  };

  # D-bus
  services.dbus.enable = true;

  # PAM service
  security.pam.services = {
    gtklock = {};
    ${username}.gnupg = {
      enable = true;
      #storeOnly = ;
      #noAutostart = ;
    };
  };

}
