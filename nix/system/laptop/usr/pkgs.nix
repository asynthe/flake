{pkgs, ...}: {
  # Flatpak
  services.flatpak.enable = true;
  fonts.fontDir.enable = true; # Fix for flatpak not finding system installed fonts.

  environment.systemPackages = with pkgs; [
    #plocate #mlocate # just one of the two. # -> service.nix?

    # NIX
    cachix # necessary? if yes add to configuration.nix (default.nix)

    # EMACS -> really needed by emacs?
    binutils
    libgccjit
    llvm
    gcc
    sqlite
    nodejs
    wmctrl
    xdotool
    neofetch

    # SYSTEM UTILS -> move to home packages except for few
    btop
    htop
    trashy

    # EXTRA
    epr
    libcryptui

    ncdu # -> home pkgs
    tree
    broot
    harfbuzz
    pciutils
    curl
    dconf
    fd
    lshw
    fontconfig
    file
    gnumake
    wget
    sosreport
    xsos
    rsync
    ripgrep
    killall

    # GUI
    font-manager
    xfce.xfce4-terminal
    xfce.mousepad

    ##### CLI #####
    entr
    acpi
    #beets
    offlineimap
    gammastep
    links2
    tldr
  ];
}
