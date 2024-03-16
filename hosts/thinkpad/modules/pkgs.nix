{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

      # Programs
      alacritty kitty
      neovim
      git

      librewolf ungoogled-chromium
      #tor-browser

      pavucontrol
      wget curl
      killall
      tree

      # Terminal
      htop
      tmux tmuxp
      lf ueberzugpp

      # GUI
      qbittorrent
      pcmanfm
      pinta

      # CLI
      ffmpeg
      imagemagick

      # Pass
      pass-wayland

      # Music
      cmus
      mpd
      ncmpcpp
      spotify

      # Security
      bleachbit
      ;
  };

}
