{ 
    imports = [

        # Secrets
        #../../secrets/secrets.nix

	../../../modules/nix/android.nix
        ../../../modules/nix/audio.nix
        ../../../modules/nix/boot.nix
	../../../modules/nix/bluetooth.nix
        ../../../modules/nix/hyprland.nix
        ../../../modules/nix/net.nix
        ../../../modules/nix/pkgs.nix
        ../../../modules/nix/settings.nix
        ../../../modules/nix/sys.nix
        ../../../modules/nix/user.nix
        ../../../modules/nix/vpn.nix

        ../../../modules/nix/game/steam.nix
        ../../../modules/nix/sys/fstrim.nix
        ../../../modules/nix/vm/libvirt.nix

        ../../../modules/nix/net/ssh/mosh.nix
        ../../../modules/nix/net/ssh/ssh.nix
        ../../../modules/nix/net/ssh/sshfs.nix

	../../../modules/nix/driver/acpi.nix
        ../../../modules/nix/net/vpn/mullvad.nix
        ../../../modules/nix/sysd/lid_switch.nix # Lid switch action for laptops.

	# Security
	../../../modules/nix/sec/clamav.nix
    ];
}
