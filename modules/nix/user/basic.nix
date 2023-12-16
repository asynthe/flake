{ config, pkgs, username, ... }: {

  users.users.${username} = {
    extraGroups = ["wheel" "video" "audio" "networkmanager" "input"];
    initialPassword = "password";
  };

  # Replace sudo with doas
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["${username}"];
          keepEnv = true;
          persist = true; # No auth every 5 mins.
          #noPass = true; # No auth.
        }
      ];
    };
  };

}
