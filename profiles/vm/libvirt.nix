{ config, pkgs, ... }: {

    users.users.${config.system.configuration.user}.extraGroups = [ "libvirtd" ];
    programs.dconf.enable = true; # Enable dconf (System Management Tool)
    virtualisation.spiceUSBRedirection.enable = true;
    services.spice-vdagentd.enable = true;
    boot.extraModprobeConfig = "options kvm_intel nested=1"; # Run KVM Hypervisors inside KVM Hypervisors

    virtualisation = {
        libvirtd = {
            enable = true;
            qemu = {
                swtpm.enable = true;
                ovmf.enable = true;
                ovmf.packages = [ pkgs.OVMFFull.fd ];
            };
        };
    };

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)
            adwaita-icon-theme # Needed if not running gnome.
	        bridge-utils
	        iproute2
	        virtiofsd
            libguestfs
            spice
            spice-gtk
            spice-protocol
            virt-manager
            virt-viewer
            win-spice
            win-virtio
            xorriso
        ;
    };
}
