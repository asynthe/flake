{ config, pkgs, lib, ... }:
with lib; with types;
let
    cfg = config.meta.vpn.mullvad;
in {
    options.meta.vpn.mullvad = {
        enable = mkEnableOption "Enable Mullvad VPN.";
    };
    config = mkIf cfg.enable {

        # -------------- Mullvad VPN --------------
        services.mullvad-vpn = {
            enable = true;
            # pkgs.mullvad only provides the CLI tool.
            # pkgs.mullvad-vpn provices both CLI and GUI.
            package = pkgs.mullvad-vpn;
        };

        # -------------- Persistence --------------
        environment.persistence."/persist".directories = mkIf config.meta.disk.persistence.enable [
            "/etc/mullvad-vpn"
            "/var/cache/mullvad-vpn"
        ];
    };
}
