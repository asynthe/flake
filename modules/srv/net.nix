{ config, ... }: {

    networking.networkmanager.enable = true;
    services.tailscale.enable = true;
    services.openssh = {
            enable = true;
	        allowSFTP = true;
            authorizedKeysFiles = [ config.sops.secrets."ssh/public/thinkpad".path ];
            #settings = {
                #PermitRootLogin = "no";
                #PasswordAuthentication = false;
                #KbdInteractiveAuthentication = false;
            #};
            #knownHosts = {
                #ben.publicKeyFile = config.sops.secrets."ssh/public/thinkpad".path;
            #};
    };
}
