{ pkgs, lib, ... }:
let
    sources = import ./nix/sources.nix;
    lanzaboote = import sources.lanzaboote;
in {
    imports = [ lanzaboote.nixosModules.lanzaboote ];

    # Lanzaboote currently replaces the systemd-boot module.
    # This setting is usually set to true in configuration.nix
    # generated at installation time. So we force it to false
    # for now.
    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.lanzaboote = {
        enable = true;
        pkiBundle = "/etc/secureboot";
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            niv
            # For debugging and troubleshooting Secure Boot.
            sbctl
        ;
    };
}
