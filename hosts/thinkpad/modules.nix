{ config, ... }: {

  imports = [

    ./modules/audio.nix
    ./modules/boot.nix
    ./modules/hyprland.nix
    ./modules/net.nix
    ./modules/pkgs.nix
    ./modules/settings.nix
    ./modules/sys.nix
    ./modules/user.nix
    ./modules/vpn.nix

  ];

}
