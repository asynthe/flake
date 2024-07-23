{ config, lib, pkgs, ... }: 
with lib;
let
    cfg = config.system;
in {

    #  TODO See what files to persist?

    options.system.secure-boot = mkOption {
        type = types.bool;
        default = "false";
        description = ''
          Enable secure boot for current system.
        '';
    };

    config = mkIf cfg.secure-boot {
        # Lanzaboote currently replaces the systemd-boot module.
        # This setting is usually set to true in configuration.nix
        # generated at installation time. So we force it to false
        # for now.
        boot.loader.systemd-boot.enable = lib.mkForce false;
        boot.lanzaboote = {
            enable = true;
            pkiBundle = "/etc/secureboot";
        };
        
        # For debugging and troubleshooting Secure Boot.
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                sbctl
            ;
        };
    };
}
