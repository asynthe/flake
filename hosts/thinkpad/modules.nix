{ config, lib, ... }: {

    # New xz update just dropped.
    # And changed to stable.
    services.openssh.enable = lib.mkForce false;

    imports = [

    ../../secrets/secrets.nix
	#../../secrets/secrets_custom.nix

	# Daemon
	../../modules/daemon/android.nix
	#../../modules/daemon/docker.nix
	../../modules/daemon/locate.nix
	../../modules/daemon/sql.nix

	# Driver
	../../modules/driver/acpi.nix
	../../modules/driver/printer.nix

        #../../modules/disko/btrfs_persist.nix
        ../../modules/audio.nix
        ../../modules/boot.nix
	../../modules/bluetooth.nix
        ../../modules/hyprland.nix
        ../../modules/net.nix
        ../../modules/pkgs.nix
        ../../modules/settings.nix
        ../../modules/sys.nix
        ../../modules/user.nix
        ../../modules/vpn.nix

        ../../modules/game/steam.nix
        ../../modules/sys/fstrim.nix
        ../../modules/vm/libvirt.nix

        ../../modules/net/ssh/mosh.nix
        ../../modules/net/ssh/ssh.nix
        ../../modules/net/ssh/sshfs.nix

        ../../modules/net/vpn/mullvad.nix
        ../../modules/sysd/lid_switch.nix # Lid switch action for laptops.

	# Security
	../../modules/sec/clamav.nix
    ];
}
