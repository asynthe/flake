{ config, pkgs, user, ... }: {

    users.users.${user}.extraGroups = [ "libvirtd" ];
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
            virt-manager
            virt-viewer
            spice
            spice-gtk
            spice-protocol
            win-virtio
            win-spice
            xorriso
            libguestfs
            ;
        inherit (pkgs.gnome) adwaita-icon-theme; # Needed if not running gnome.
    };
}
