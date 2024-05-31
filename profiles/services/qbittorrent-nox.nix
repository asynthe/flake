{ config, lib, pkgs-stable, ... }:
with lib; 

# See the logs by running.
# journalctl -u qbittorrent-nox.service

let
    cfg = config.services.qbittorrent-nox;
in {
    options.services.qbittorrent-nox.enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Set up the qBittorrent-nox daemon.
        '';
    };

    config = mkIf cfg.enable {



        # ADD persistence option.
        environment.systemPackages = builtins.attrValues { inherit (pkgs-stable) qbittorrent-nox; };

        networking.firewall = {
            allowedTCPPorts = [ 8080 ];
            allowedUDPPorts = [ 8080 ];
        };

        systemd.user.services.qbittorrent-nox = {
            description = "qBittorrent-nox service";
            path = [ pkgs-stable.qbittorrent-nox ];
            after = [ "network.target" ];
            wantedBy = [ "default.target" "multi-user.target" ];
            serviceConfig = {
                Type = "simple";
                ExecStart = ''
                  ${pkgs-stable.qbittorrent-nox}/bin/qbittorrent-nox
                '';
            };
        };
    };
}
