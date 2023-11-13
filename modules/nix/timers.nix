{ config, pkgs, ... }: {

  # Enable custom systemd services and timers.

  imports = [

    ./timer/backup_notes.nix # Simple user unit that runs a backup script.

  ];
}
