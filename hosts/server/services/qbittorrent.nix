{ config, pkgs, ... }: {

  # Create a systemd service and timer that runs qbittorrent
  environment.systemPackages = builtins.attrValues { inherit (pkgs) qbittorrent-nox; };

  # systemd service
  systemd.user.services."qbittorrent-webui" = {
    description = "qBittorrent-nox service";
    documentation = [ "man:qbittorrent-nox(1)" ];
    after = [ "network-online.target" "nss-lookup.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "exec";

    # Try also like this.
    #unitConfig = {
      #Description=qBittorrent-nox service
      #Documentation=man:qbittorrent-nox(1)
      #Wants=network-online.target
      #After=network-online.target nss-lookup.target
    #};
    #serviceConfig = {
      #Type=exec
      # change user as needed
      #User=qbtuser
      # The -d flag should not be used in this setup
      #ExecStart=/usr/bin/qbittorrent-nox
    #};
  };
}
