{ config, ... }: {

  imports = [

    ./3d.nix
    ./audio.nix
    ./emacs.nix
    ./image.nix
    ./video.nix

  ];
}
