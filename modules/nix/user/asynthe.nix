{ config, pkgs, username, ... }: {

  # User
  users.users.${username} = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["wheel" "video" "audio" "networkmanager" "lp" "scanner" "input"];
    initialPassword = "password";
  };
  programs.zsh.enable = true; # Needed by users.users.${username}.shell


  # Replace sudo with doas
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["${username}"];
          keepEnv = true;
          #persist = true; # No auth every 5 mins.
          noPass = true; # No auth.
        }
      ];
    };
  };

  services = {
    # D-bus
    dbus.enable = true;
    # Mouse on the TTY
    gpm = {
      enable = true;
      protocol = "ps/2";
    };
  };

  # Console / TTY configuration
  console = {
    earlysetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [terminus_font];
    #keyMap = "us"; remove (?)
    #useXkbOptions = true; # use xkbOptions in tty.
  };

  # PAM service
  security.pam.services = {
    gtklock = {};
    ${username}.gnupg = {
      enable = true;
      #storeOnly = ;
      #noAutostart = ;
    };
  };


  # Fonts
  fonts = {
    packages = with pkgs; [
      source-code-pro
      font-awesome
      iosevka-comfy.comfy
      corefonts
      nerdfonts
      # Japanese
      ipafont
      kochi-substitute
    ];

    #fontconfig.defaultFonts = {
      #monospace = ["DejaVu Sans Mono" "IPAGothic"];
      #sansSerif = ["DejaVu Sans" "IPAPGothic"];
      #serif = ["DejaVu Serif" "IPAPMincho"];
    #};
  };

  # Environment and locale
  environment = {
    shells = with pkgs; [zsh];
    binsh = "${pkgs.dash}/bin/dash"; # change sh for dash.
    variables = {
      TERMINAL = "Alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    sessionVariables = rec {
      PATH = [
        "\${XDG_BIN_HOME}"
      ];

      # XDG SPECIFICATIONS
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      XDG_STATE_HOME = "\${HOME}/.local/state";
    };
  };

  # Packages
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
