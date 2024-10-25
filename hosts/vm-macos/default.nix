{
    imports = [
        ./disk.nix
        ./system.nix

        ../../profiles # Import all the custom options.

	    # Server
        ../../modules/srv/shell.nix
        ../../modules/pkgs/minimal.nix
    ];
}
