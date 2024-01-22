{ config, pkgs, ... }: {

  # Create a systemd service and timer that runs qbittorrent
  environment.systemPackages = builtins.attrValues { inherit (pkgs) qbittorrent-nox; };

}
