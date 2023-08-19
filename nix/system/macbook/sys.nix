{ config, pkgs-darwin, ... }:
{

 # Auto upgrade nix package and the daemon service.
 services.nix-daemon.enable = true; # Make sure it always runs.
 system.defaults.dock.autohide = true;

}
