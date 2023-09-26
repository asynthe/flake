{
  config,
  pkgs,
  ...
}: {
  # Plymouth boot splash screen
  boot.plymouth.enable = true;

  # Don't suspend/hibernate when closing laptop lid
  # Options: ignore, poweroff, reboot, halt, kexec, suspend, hibernate, hybrid-sleep, suspend-then-hibernate, lock.
  services.logind.lidSwitch = "ignore"; # or
  #services.logind.extraConfig = "HandleLidSwitch=ignore";

  # BOOTLOADER
  boot = {
    kernelParams = [
      # Silent boot
      "quiet"
      "splash"
      "log_level=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      #"nohibernate"
      #"button.lid_init_state=open"
    ];
    consoleLogLevel = 0;
    supportedFilesystems = [
      "ext4"
      #"bcachefs"
      "btrfs"
      "xfs"
      "zfs"
    ];
    loader = {
      # EFI
      efi = {
        #systemd-boot.enable = true; # systemd-boot EFI boot loader
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      # GRUB
      grub = {
        enable = true;
        #version = 2; # deprecated
        configurationLimit = 5;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;

        # Custom Grub Theme Test - Not Working (package location?)
        #extraConfig = "set theme=${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze/theme.txt";
        #splashImage = null;
      };
    };
  };

  boot.initrd.luks.devices = {
    crypt = {
      device = "/dev/disk/by-uuid/2fd0b0d6-7c7f-461d-8ba6-d6aa6d3a2401";
      preLVM = true;
    };
  };
  #boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/eb79a748-75bc-41d6-9b74-df1726965260";
  #boot.initrd.luks.devices."crypt".preLVM = true;
  boot.initrd.availableKernelModules = ["aesni_intel" "cryptd"];
  #boot.initrd.cryptoModules = [ "aes" "aes_generic" "blowfish" "twofish" "serpent" "cbc" "xts" "lrw" "sha1" "sha256" "sha512" "af_alg" "algif_skcipher" ];

  # Console / TTY configuration
  console = {
    #earlySetup = true; # Not working because of this?
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [terminus_font];
    keyMap = "us"; # or us/dvous/dvorak/etc
    #useXkbConfig = true; # use xkbOptions in tty.
  };

  # GPM - Mouse on TTY
  services.gpm = {
    enable = true;
    protocol = "ps/2";
  };
}
