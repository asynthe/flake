{ config, pkgs, ... }: {

  networking.hostName = "server";
  server = {
    user.enable = true; # both 'rizuki' 'ben'.
    networkmanager.enable = true;
    #services = {
      #qbittorent = true;
    #};
  };

  # MOVE TO SECRETS!
  services.openssh = {
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    knownHosts = {
      ben.publicKey = config.sops.secrets."ssh/user/asynthe";
      #rizuki.publicKey = "";
    };
  };

  imports = [
    ./hardware.nix

    # Bootloader
    ../../../modules/nix/boot/systemd_boot.nix

    # System
    ../../../modules/nix/nix/settings.nix # Nix daemon settings.
    ../../../modules/nix/sys/locale/en_jp.nix # English and Japanese.
    ../../../modules/nix/sys/user.nix # Users.

    # Drivers
    ../../../modules/nix/driver/intel.nix

    # Network
    ../../../modules/nix/net/nm.nix # Network Manager configuration.
    ../../../modules/nix/net/ssh/ssh.nix
    ../../../modules/nix/net/vpn/mullvad.nix
    ../../../modules/nix/net/vpn/tailscale.nix
    ../../../modules/nix/daemon/cups.nix # Printer

    # Services
    ./services/qbittorrent.nix
    #./services/postgresql.nix
  ];

  # List of packages I want to have on any computer.
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      alacritty kitty # Always good to have some extra terminals.
      wget curl
      git # Git must be installed before flakes.
      cachix
      tmux
      neovim
      ;
  };
}
