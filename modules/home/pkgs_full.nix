{ pkgs, ... }: {

  programs = {
    eza = {
      enable = true;
      icons = true;
      enableAliases = true;
    };

    skim = {
      enable = true;
      #package = ;
      #defaultCommand = ;
      #defaultOptions = ;
    };
    fzf = {
      enable = true;
      #package = ;
      #colors = ;
      #tmux.enableShellIntegration = true;
      #tmux.ShellIntegrationOptions = ;
    };

    git = {
      enable = true;
      #userName = "Benjamin Dunstan";
      #userEmail = "benjadunstan@gmail.com";
    };
    imv = {
      enable = true;
      #package = ;
      #settings = ;
    };

    zoxide = {
      enable = true;
      #package = ;
      #options = ;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      # Replace in future
      keepassxc # change into password store
      bless
      hexedit
      hexyl # Hex editor
      libqalculate # Where to put?
      btop
      
      # Terminals
      alacritty
      kitty
      kitty-themes
      cool-retro-term

      # Utils
      gparted
      ventoy-full #ventoy
      #etcher

      # Bluetooth
      bluez
      bluez-tools
      bluetuith # bluetooth ncurses frontend
      
      # GUI
      obsidian

      # PDF
      zathura # minimalistic pdf viewer
      xournalpp
      masterpdfeditor4 #masterpdfeditor
      pdfarranger

      # Browser
      librewolf #librewolf-unwrapped
      mullvad-browser
      #ungoogled-chromium #chromium # Already on default list.

      # Torrents
      #aria #ariang
      qbittorrent #qbittorrent-nox

      #radarr #lidarr #sonarr
      
      # Astronomy
      stellarium
      celestia
      libnova

      # OCR
      tesseract
      qt-box-editor # OCR engine
      #easyocr
      
      # Officematics
      #libreoffice
      slides
      #zoom-us
      #slack #slack-cli #slack-term # testing
      
      # Archives
      zip unzip 
      unar # Allows for unzipping with Unicode characters.
      p7zip
      xz
      rar #unrar #rar2fs
      #torrent7z
      #mdf2iso
      
      # File managers
      pcmanfm
      # Thumbnailers (for PCmanFM)
      nufraw-thumbnailer # .raw files (raw-thumbnailer)
      evince # Adobe .pdf files
      ffmpegthumbnailer # Video files
      freetype # Font files
      libgsf # .odf files
      ;

    # Previewers for PCmanFM
    inherit (pkgs.libsForQt5) dolphin; # File manager
    inherit (pkgs.xfce) thunar tumbler; # Image files

    # Alarm Clocks
    inherit (pkgs.gnome) gnome-clocks;
    inherit (pkgs.libsForQt5) kalarm;
  };

}
