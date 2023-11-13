{ config, pkgs, ... }: {

  imports = [

    ./timer/backup_notes.nix # Simple user unit that runs a backup script.

  ];
}
