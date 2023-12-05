{ config, lib, pkgs, pkgs-darwin, username_mac, ... }: {

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
    trusted-users = ["${username_mac}"]; # try groups like "@admin"
    #experimental-features = [ "nix-command" "flakes" ];

    #substituters = ["https://cache.nixos.org/"]; # IS THIS NEEDED?
    #trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="]; # IS THIS NEEDED?
  };

  #nix.extraOptions =
    #''
      #auto-optimise-store = true;
      #experimental-features = nix-command flakes
    #''
    #+ lib.optionalString (pkgs.system == "aarch64-darwin") ''
      #extra-platforms = x86_64-darwin aarch64-darwin
    #'';

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      alacritty
      kitty
      ;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      recursive
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true; # Make sure it always runs.

  #system = {
    #defaults.dock.autohide = true;
    #keyboard = {
      #enableKeyMapping = true;
      #remapCapsLockToEscape = true;
    #};
  #};
}
