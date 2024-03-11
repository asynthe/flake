{ config, lib, pkgs, ... }: 

let

  defaultUser = "nixos";
  automountPath = "/mnt";

in {

  boot.isContainer = true;
  networking.dhcpcd.enable = false;

  # WSL
  # Add option to start WSL from ~ instead of current windows path.
  wsl = {
    enable = true;
    #defaultUser = "${defaultUser}";
    nativeSystemd = true;
    startMenuLaunchers = true; # shortcuts for GUI applications in the windows start menu.

    #useWindowsDriver = true; # OpenGL driver from the windows host.
    #usbip.enable = true; # USP/IP integration.
    #usbip.autoAttach = [ ];

    wslConf = {
      #automount.root = "${automountPath}"; # Directory where windows drives are mounted.
      automount.root = "/home/${defaultUser}/windows";
      #interop.enabled = true; # Run windows binaries from the linux shell.
      #interop.appendWindowsPath = false;
    };
  };

  # Disable systemd units that don't make sense on WSL
  systemd = {
    enableEmergencyMode = false; # We don't have a console.
    services = {
      firewall.enable = false;
      systemd-resolved.enable = false;
      systemd-udevd.enable = false;
      "serial-getty@ttyS0".enable = false;
      "serial-getty@hvc0".enable = false;
      "getty@tty1".enable = false;
      "autovt@".enable = false;
    };
    
    # FIX PLEASE
    # This not working with `wsl.startMenuLaunchers = true;`
    #tmpfiles.settings.wsl = {
      #"usr/share/applications".L = {
        #argument = "/etc/profiles/per-user/${defaultUser}/share/applications";
      #};
      #"usr/share/icons".L = {
        #argument = "/etc/profiles/per-user/${defaultUser}/share/icons";
      #};
    #};
  };

  # Environment variables
  environment = {
    etc = { 
      "wsl.conf".text = ''
        [automount]
        enabled=true
        mountFsTab=true
        root=${automountPath}/
        options=metadata,uid=1000,gid=100
      '';
      hosts.enable = false;
      "resolv.conf".enable = false;
    };

    variables = {
      DISPLAY = ":0";
      WAYLAND_DISPLAY = "wayland-0";

      PULSE_SERVER = "${automountPath}/wslg/PulseServer";
      XDG_RUNTIME_DIR = "${automountPath}/wslg/runtime-dir";
      WSL_INTEROP = "/run/WSL/1_interop";
    };
  };

  # Fonts
  fonts.packages = builtins.attrValues {
    inherit (pkgs)

      corefonts
      font-awesome

      nerdfonts
      #(nerdfonts.override { fonts = [ 
        #"FiraCode"
	#"FiraMono"
	#"Iosevka"
	#"IosevkaTerm"
	#"JetBrainsMono"
	#"Meslo"
      #]; })

      # JP
      ipafont
      kochi-substitute
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      ;
  };

  system.activationScripts.copy-launchers.text = ''
    if [ ! -d "/usr/share/" ]; then
      mkdir /usr/share/
    fi
    for x in applications icons; do
      echo "Copying /usr/share/$x"
      rm -rf /usr/share/$x
      cp -r $systemConfig/sw/share/$x/. /usr/share/$x
    done
  '';
}
