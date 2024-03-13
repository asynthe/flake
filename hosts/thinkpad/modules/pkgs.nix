{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

      # Programs
      alacritty kitty
      neovim
      git
      tmux lf htop

      librewolf ungoogled-chromium
      #tor-browser

      pavucontrol
      wget curl
      killall
      tree

      # GUI
      qbittorrent
      pcmanfm

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
      ;
  };

}
