{ config, pkgs, username, sops-nix, ... }: {

    sops.secrets."password/ben".neededForUsers = true;
    users.mutableUsers = false; # Required for passwords set by sops.

    users.users.${username} = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "にゃ！";
	hashedPasswordFile = config.sops.secrets."password/ben".path;
        extraGroups = [ "audio" "networkmanager" "input" "wheel" ];
    };

    programs.zsh.enable = true;

    security.sudo.extraConfig = ''
      Defaults timestamp_timeout=120 # Ask for password every 2 hours.
    '';
}
