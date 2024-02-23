{ config, pkgs, ... }: {

    security.pam.services = {
        gtklock = {};
        ${username}.gnupg = {
            enable = true;
            #storeOnly = ;
            #noAutostart = ;
        };
    };
}
