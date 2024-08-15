{
    imports = [
	    ../../profiles/disko # Disko configuration # IN PROGRESS

        ../../profiles # Import all the custom options.
        ./vmhardware.nix # Import hardware scan.

	    # Server
        ../../modules/srv/shell.nix
        ../../modules/pkgs/minimal.nix
    ];
}
