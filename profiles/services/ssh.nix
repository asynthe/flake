{ config, lib, ... }:
with lib; with types;
let
    cfg = config.framework.services.ssh;
in {
    options.framework.services.ssh = {
        enable = mkOption {
            type = bool;
            default = false;
            description = ''
              Enable SSH daemon.
            '';
        };
        configuration = mkOption {
            type = str;
            default = false;
            description = ''
              Configuration for SSH.
            '';
        };
        mosh = mkOption {
            type = bool;
            default = false;
            description = ''
              Enable Mosh, SSH with the UDP Protocol.
            '';
        };
    };

    config = mkIf cfg.enable {
        programs.mosh.enable = mkIf cfg.mosh true;
        services.openssh = mkMerge [
            {
                enable = true;
            }

            # Laptop
            (mkIf (cfg.configuration == "laptop") { 
                allowSFTP = true;
                #startWhenNeeded = true; # Socket-activated.
            })

            # Server
            (mkIf (cfg.configuration == "server") {
	            allowSFTP = true;
                #startWhenNeeded = true; # Socket-activated.
                banner = builtins.readFile ./banner/server;
                settings = {
                    #PermitRootLogin = "no"; # Messes up with nixos-anywhere.
                    PasswordAuthentication = false;
                    KbdInteractiveAuthentication = false;
                };
                extraConfig = ''
                  PrintlastLog no
                  PrintMotd no
                '';
            })
        ];
    };
}
