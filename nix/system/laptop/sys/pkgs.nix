{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [


      #plocate #mlocate # just one of the two. # -> service.nix?

      # NIX
      cachix # necessary? if yes add to configuration.nix (default.nix)

      playerctl # -> audio.nix (home? not-home?)
      (pkgs.uutils-coreutils.override { prefix = ""; }) # Replace coreutils with uutils. # Is this already on home-manager?

      # EMACS -> really needed by emacs?
      binutils
      libgccjit
      llvm
      gcc
      sqlite
      nodejs wmctrl xdotool
      neofetch

      nvme-cli # -> zfs?
      hdparm # -> zfs?

      ### -> zfs.nix
      # BACKUPS
      sanoid # -> zfs.nix
      borgbackup
      restic
      tarsnap       
      # FS PROGS
      xfsprogs
      btrfs-progs
      ntfs3g

      # FIX
      #ciscoPacketTracer8

      # GTK / QT TESTING
      qt6.qtwayland 
      qt6.qtwebengine 
      qt6.qt5compat
      libsForQt5.qt5.qtwayland
      libsForQt5.qtstyleplugins
      libsForQt5.qt5ct
      qtchan
      adwaita-qt
      adwaita-qt6
      
      # SYSTEM UTILS -> move to home packages except for few
      btop
      htop
      trashy
      gpm # is this needed if service?
      
      # EXTRA
      ncpamixer
      epr
      libcryptui

      # Hex editor
      bless
      hexedit
      hexyl

      pavucontrol # -> media.nix?
      pulsemixer # -> media.nix?
      # CD / DVD Tools -> media.nix?
      #cdemu-client # tools for emulating optical and discs
      #cdemu-daemon # tools for emulating optical and discs
      #gcdemu # tools for emulating optical and discs

      ncdu # -> home pkgs
      tree
      broot
      progress #test
      harfbuzz
      pciutils
      curl
      dconf
      doas
      fd
      lshw
      fontconfig
      file
      gnumake
      ripgrep
      rsync
      killall
      wget
      sosreport xsos

      # ------------------------------------------------------

      ##### NVIDIA #####
      #nvidia-offload
      glibc
      #linuxKernel.packages.linux_6_2.bbswitch
      #libva
      #libva-utils
      #libdrm
      #mesa
      #mesa-demos
      glxinfo
      #virtualgl
      zenith-nvidia
      nvtop-nvidia
      vulkan-tools

      ##### WAYLAND #####
      # Other TWMs
      dwl
      wayfire

      # SYSTEM -> hyprland?
      wayland
      wayland-utils
      wayland-scanner
      wlroots
      wlr-protocols
      wl-clipboard
      wdisplays #wlr-randr #kanshi
      brightnessctl #brillo

      # X11 APPS -> xmonad.nix

      # APPS
      #dmenu
      #haskellPackages.xmobar
      lxappearance #lxappearance-gtk2
      #nitrogen
      nsxiv
      xorg.xlsclients 
      #xorg.xprop 
      #xorg.xinit
      #xclip
      #picom-jonaburg

      # GUI
      element-desktop-wayland
      font-manager
      xfce.xfce4-terminal
      xfce.mousepad
      lxappearance

      ##### CLI #####
      entr
      acpi
      #beets
      offlineimap
      gammastep
      links2
      tldr


  ];

  ##### TESTING TO IMPORT #####
  #programs.noisetorch = { # Mic noise-supression
    #enable = true;
    #package = ;
  #};

  # NPM (Node Package Manager)
  #programs.npm = { # Not really working as intended, have to learn more.
    #enable = true;
    #package = ;
    #npmrc = ''
  #};

  # POSTGRESQL
  #services.postgresql = {
    #enable = true;
    #port = ; # Between 0 and 65535, default 5432
    #enableTCPIP = ;
    #dataDir = ;
    #Backup.location = ;
    #package = ;
    #extraPlugins = ;
  #};

  # Wshowkeys - A wayland keystrokes show
  # MOVE TO HYPRLAND FILE
  programs.wshowkeys.enable = true;

  # Wireshark
  # MOVE TO NETWORKING
  programs.wireshark = {
    enable = true;
    #package = [];
  }; 

  # CUPS 
  # MOVE TO PRINTER FILE
  # Linux printer drivers + hp.
  services.printing.enable = true;

  # Flatpak
  # FLATPAK SERVICE OR FLATPAK FILE
  services.flatpak.enable = true;

  # OPENRGB
  # IDFK
  services.hardware.openrgb = {
    enable = true;
    #server.port = ....; # from 0 to 65535, default 6742
    #package = with pkgs; [ ];
    motherboard = "intel"; # CPU family of motherboard, amd, intel or null.
  };

}
