{
    networking.networkmanager.enable = true;
    services.tailscale.enable = true;

    services.openssh = {
            enable = true;
	        allowSFTP = true;
            permitRootLogin = "no";
            passwordAuthentication = false;
            KbdInteractiveAuthentication = false;
            knownHosts = {
                ben.publicKeyFile = config.sops.secrets."ssh/public/thinkpad";
            };
    };
}
