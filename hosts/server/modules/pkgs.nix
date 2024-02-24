{ config, pkgs, ... }: {

    # -> Secrets !
    #services.openssh = {
        #settings = {
            #PasswordAuthentication = false;
            #KbdInteractiveAuthentication = false;
            #knownHosts = {
                #ben.publicKey = config.sops.secrets."ssh/user/asynthe";
                #rizuki.publicKey = "";
            #};
        #};
    #};
    
    # Pkgs
    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            alacritty kitty # Always good to have some extra terminals.
            wget curl
            git # Git must be installed before flakes.
            cachix
            tmux
            neovim
        ;
    };
}
