{
    imports = [
        ../../profiles # Import all the custom options.

        ./disk.nix # Import disk configuration.
        ./hardware.nix # Import hardware scan.
        ./system.nix # Import custom configuration.

        # Modules that haven't been option-nized yet.
        ../../profiles/vpn/mullvad.nix
        #../../profiles/vpn/libvirt.nix
        #../../profiles/vpn/vmware.nix
    ];
}
