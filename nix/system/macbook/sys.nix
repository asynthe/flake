{ config, pkgs-darwin, username_mac, ... }:
{

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true; # Make sure it always runs.
  system.defaults.dock.autohide = true;

  nixpkgs = {
    hostPlatform = {
      config = "aarch64-darwin";
      system = "aarch64-darwin";
      };

    # Cross-compilation
    #buildPlatform = {
      #config = "aarch64-darwin";
      #system = "aarch64-darwin";
      #};
  };

  #services.nix-daemon.package = pkgs.Flakes; # Installs a version of nix, that doesn't need "experimental-features = nix-command flakes";
  # in /etc/nix/nix.conf

  nix.settings = {
    trusted-users = [ "${username_mac}" ];
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://cache.nixos.org/" ];
    extra-trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
  };

}
