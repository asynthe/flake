{ config, ... }: {

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
}
