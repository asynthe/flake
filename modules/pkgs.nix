{ pkgs, ... }: {

    programs.wshowkeys.enable = true;

    environment.systemPackages = builtins.attrValues {
        inherit (pkgs)

            # Testing
    	    usbutils
            vulnix
            testdisk testdisk-qt

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
            tmux #tmuxp
            lf ueberzugpp

            # GUI
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

            # Security
            bleachbit
      ;
  };
}
