{ config, pkgs, username, ... }: {
 
  # Manage the virtualization services
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [pkgs.OVMFFull.fd];
    };
  };
  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true;

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
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

  # Run KVM Hypervisors inside KVM Hypervisors
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}
