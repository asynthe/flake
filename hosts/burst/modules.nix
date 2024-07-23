{
    imports = [
        # Disk configuration
        ../../modules/disko/btrfs.nix
        ../../modules/disko/persistence.nix

        # Files
        ../../modules/srv/burst/pkgs.nix
        ../../modules/srv/burst/shell.nix
        ../../modules/srv/burst/user.nix
    ];
}
