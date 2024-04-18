{ config, pkgs, user, ... }: {

    users.users.${user} = {
	initialPassword = "meows";
        description = "にゃ！";
        extraGroups = [ "audio" "networkmanager" "input" "wheel" ];
        isNormalUser = true;
    };

    security.sudo.extraConfig = ''
      Defaults timestamp_timeout=120 # Ask for password every 2 hours.
    '';
}
