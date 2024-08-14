{ pkgs, user, ... }: {

    # Setting up a new user.
    # Check the manual at:
    # https://nix-community.github.io/NixOS-WSL/how-to/change-username.html
    wsl.defaultUser = "missingno";

    wsl = {
        startMenuLaunchers = true;
        #wslConf = {
            # This messes up with /etc/resolv.conf.
            # As it tries to symlink the file from the folder we specified here.
            # If it's a user folder, then the process doesn't work or cannot be generated.

            #automount.root = "/home/${user}/win"; 
        #};
    };

    # User
    users.users.${user} = {
        shell = pkgs.zsh;
        isNormalUser = true;
        description = "にゃ！";
        extraGroups = [ "audio" "networkmanager" "input" "wheel" ];
    };
    
    programs.zsh.enable = true;
    security.sudo.extraConfig = ''
      Defaults timestamp_timeout=120 # Ask for password every 2 hours.
    '';
}
