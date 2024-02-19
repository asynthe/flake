{ config, pkgs, ... }: {

  # Fonts
  fonts.packages = builtins.attrValues {
    inherit (pkgs)

      corefonts
      font-awesome

      nerdfonts
      #(nerdfonts.override { fonts = [ 
        #"FiraCode"
	#"FiraMono"
	#"Iosevka"
	#"IosevkaTerm"
	#"JetBrainsMono"
	#"Meslo"
      #]; })

      # JP
      ipafont
      kochi-substitute
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      ;
  };

  # IME - fcitx5 + mozc
  i18n = {
    supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-configtool
      ];
    };
  };

  # Environment variables
  environment = {
    binsh = "${pkgs.dash}/bin/dash"; # Change sh for dash.
    
    variables = {
      TERMINAL = "Kitty";
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    
    sessionVariables = rec {
      # XDG
      #PATH = [ "\${XDG_BIN_HOME" ];
      #XDG_CACHE_HOME = "\${HOME}/.cache";
      #XDG_CONFIG_HOME = "\${HOME}/.config";
      #XDG_BIN_HOME = "\${HOME}/.local/bin";
      #XDG_DATA_HOME = "\${HOME}/.local/share";
      #XDG_STATE_HOME = "\${HOME}/.local.state";

      # IME
      XMODIFIERS = "@im=fcitx";
      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };
}
