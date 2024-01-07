{ config, ... }: {

  imports = [

    # Choose your preffered hardware configuration.
    #./server/hardware.nix # Server
    ./thinknya/hardware.nix # Thinkpad

  ];

}
