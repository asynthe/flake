{ config, username, ... }: {

    users.extraGroups.vboxusers.members = [ "${username}" ];
    virtualisation.virtualbox = {
        # Host Configuration
        host = {
            enable = true;
            #headless = ;
            #enableWebService = ;
            enableExtensionPack = true; # Required to forward usb2/usb3 to guests. Requires nixpks.config.allowUnfree = true
            #addNetworkInterface = ; # Sets up vboxnet0
        };

        # Guest Additions, both need to be enabled.
        guest = {
            enable = true;
            x11 = true;
        };
    };
}
