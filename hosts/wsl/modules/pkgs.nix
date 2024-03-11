{ config, pkgs, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)

      # Packages
      emacs29-pgtk
      neovim
      zathura

      # Test

      # Programs
      git
      tmux lf htop
      wget curl
      killall
      tree

      # GUI
      alacritty kitty

      # Pass
      wl-clipboard
      pass-wayland

      # Music
      cmus
      mpd
      ncmpcpp
      ;
    inherit (pkgs.xorg) xeyes;
  };

}
