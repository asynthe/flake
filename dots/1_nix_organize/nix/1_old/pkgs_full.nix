{ pkgs, ... }: {
    imv = {
      enable = true;
      #package = ;
      #settings = ;
    };

  home.packages = builtins.attrValues {
    inherit
      (pkgs)

      # Replace in future
      bless
      hexedit
      hexyl # Hex editor
      btop
      
      # Terminals
      alacritty
      kitty
      kitty-themes
      cool-retro-term

      # Browser
      librewolf #librewolf-unwrapped
      mullvad-browser
      #ungoogled-chromium #chromium # Already on default list.
      
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
