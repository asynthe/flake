{ config, ... }: {

    users.extraGroups.vboxusers.members = [ "${config.framework.system.user}" ];
    virtualisation.virtualbox.host.enable = true;

    # Requires recompilation and nixpkgs.config.allowUnfree = true.
    #virtualisation.virtualbox.host.enableExtensionPack = true; # Required to forward usb2/usb3 to guests.
    #virtualisation.virtualbox.guest.enable = true; # Guest Additions, both need to be enabled.

    #virtualisation.virtualbox = {
        # Host Configuration
        #host = {
            #enable = true;
            #headless = ;
            #enableWebService = ;
            #addNetworkInterface = ; # Sets up vboxnet0
        #};
    #};
}
