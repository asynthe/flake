{ config, lib, pkgs, ... }: 
with lib; with types;
let
    cfg = config.meta;
in {
    #  TODO See what files to persist?
    options.meta.boot.secure = mkEnableOption "Enable secure boot for current system.";

    config = mkIf cfg.boot.secure {

        # -------------- Process --------------
        # 1. Disable Secure Boot, 
        # `nix-shell -p sbctl`
        # `sudo sbctl create-keys`
        # Rebuild system with option on.
        # `sudo sbctl verify` to do final check.
        #
        # 2. Enable Secure Boot and boot into NixOS
        # Enroll keys with `sudo sbctl enroll-keys --microsoft`

        # -------------- Lanzaboote --------------
        # Lanzaboote currently replaces the systemd-boot module.
        # This setting is usually set to true in configuration.nix
        # generated at installation time. So we force it to false
        # for now.
        boot.loader.systemd-boot.enable = mkForce false;
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
        # -------------- Persistence --------------
        environment.persistence."/persist".directories = mkIf cfg.disk.persistence.enable [
            config.boot.lanzaboote.pkiBundle  
        ];
    };
}
