{ config, lib, pkgs, ... }:
with lib;
let
    cfg = config.services.ssh;
in {

    options.services.ssh = {
        enable = mkOption {
            type = types.bool;
            default = false;
            description = ''
              Enable SSH daemon.
            '';
        };
        configuration = mkOption {
            type = types.str;
            default = false;
            description = ''
              Configuration for SSH.
            '';
        };
        mosh = mkOption {
            type = types.bool;
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

            (mkIf (cfg.configuration == "laptop") { 
                allowSFTP = true;
                #startWhenNeeded = true; # Socket-activated.
            })

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
