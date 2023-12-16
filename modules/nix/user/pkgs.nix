{ pkgs, ... }: {

  # Move to FLATPAK.NIX!
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = builtins.attrValues {
      inherit
        (pkgs)
	xdg-desktop-portal-gtk
	;
    };
  };
  fonts.fontDir.enable = true; # Fix for flatpak not finding system installed fonts.
  # Flatpak

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)

      # CLI
      direnv
      eza
      lf
      starship
      ueberzugpp
      fzf skim
      zoxide

      # GUI
      librewolf
      ungoogled-chromium
      pavucontrol

      cachix # necessary? if yes add to configuration.nix (default.nix)
      #nodejs
      #wmctrl
      xdotool
      neofetch
   
      # SYSTEM UTILS -> move to home packages except for few
      trashy
   
      # EXTRA
      epr
      libcryptui
   
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
      sosreport
      xsos

      ripgrep
   
      ##### CLI #####
      tree
      wget
      rsync
      ncdu
      killall
      btop
      htop
      entr
      acpi
      #beets
      offlineimap
      gammastep
      links2
      tldr
   
      # GUI
      font-manager

      # NECESSARY?
      # EMACS -> really needed by emacs?
      binutils
      libgccjit
      llvm
      gcc
      sqlite
      ;

  inherit 
    (pkgs.xfce)
      xfce4-terminal
      mousepad
      ;
  };
}
