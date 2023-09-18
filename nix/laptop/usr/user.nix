{
  config,
  pkgs,
  username,
  ...
}: {
  # User
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["docker" "wheel" "video" "audio" "networkmanager" "lp" "scanner" "input"];
    initialPassword = "password";
  };
  programs.zsh.enable = true; # Needed by users.users.${username}.shell

  # Dbus
  services.dbus.enable = true;

  # Replace sudo with doas
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = ["${username}"];
        keepEnv = true;
        #persist = true; # no auth every 5 mins.
        noPass = true;
      }
    ];
  };

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
