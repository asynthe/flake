{ config, pkgs, lib, ... }:
with lib; with types;
let
    cfg = config.meta.vm.libvirt;
in {
    options.meta.vm.libvirt = {
        enable = mkEnableOption "Enable QEMU and libvirt.";    
    };

    config = mkIf cfg.enable {

        # -------------- QEMU and libvirt --------------
        users.users.${config.meta.system.user}.extraGroups = [ "libvirtd" ];
        programs.dconf.enable = true; # Enable dconf (System Management Tool)
        virtualisation.spiceUSBRedirection.enable = true;
        services.spice-vdagentd.enable = true;
        boot.extraModprobeConfig = "options kvm_intel nested=1"; # Run KVM Hypervisors inside KVM Hypervisors

        virtualisation.libvirtd = {
            enable = true;
            qemu.swtpm.enable = true;
            qemu.ovmf.enable = true;
            qemu.ovmf.packages = [ pkgs.OVMFFull.fd ];
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
    };
}
