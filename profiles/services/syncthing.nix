{ config, pkgs, user, lib, ... }:
with lib;
let
    cfg = config.services.syncthing;
in {
    options.services.syncthing.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Enable and set up Syncthing.
        '';
    };

    config = mkIf cfg.enable {

        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                syncthing
                syncthingtray
                stc-cli
            ;
        };

        # Enable and configure.
        #services.syncthing = {
            #enable = true;
            #systemService = true; # Run as system service.
            #user = "${user}";
            #package = ;
            #group = ""; Group to run Syncthing under, default 'syncthing'.
            #extraFlags = ;
            #devices = ;
            #dataDir = "";

            # Shared folders.
            #folders = ;
        #};

        #services.syncthing.relay = {
            #enable = true;
            #port = ; default `22067`. Needs to be added to networking.firewall.allowedTCPPorts
        #};

        #networking.firewall.allowedTCPPorts = config.services.syncthing.relay.port;
    };
}
