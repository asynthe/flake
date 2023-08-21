{ config, pkgs, ... }:

{
 
  #users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # SUDO -> DOAS
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [{
      users = [ "${user}" ];
      keepEnv = true;
      #persist = true; # no auth every 5 mins.
      noPass = true;
    }];
  };

  # ENVIRONMENT
  environment = {
    shells = with pkgs; [ zsh ];
    binsh = "${pkgs.dash}/bin/dash"; # change sh for dash.
    variables = {
      TERMINAL = "Alacritty";
      EDITOR = "nvim";
      VISUAL = "nvim";
      };

    sessionVariables = rec {
      # XDG SPECIFICATIONS
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
      XDG_STATE_HOME = "\${HOME}/.local/state";

      # IME
      # I use Fcitx5 and mozc to write in Japanese.
      XMODIFIERS="@im=fcitx";
      GTK_IM_MODULE="fcitx";
      QT_IM_MODULE="fcitx";
      SDL_IM_MODULE="fcitx";
      GLFW_IM_MODULE="ibus";
 
      PATH = [
        "\${XDG_BIN_HOME}"
	];
      };
  };

  # Timezone and Internationalisation
  # Find japanese, japanese.nix?
  time.timeZone = "Australia/Perth"; # Timezone.

  #i18n = {
    #defaultLocale = "en_US.UTF-8";
    #extraLocaleSettings = {
      #LC_ADDRESS = "zh_CN.UTF-8";
      #LC_IDENTIFICATION = "zh_CN.UTF-8";
      #LC_MEASUREMENT = "zh_CN.UTF-8";
      #LC_MONETARY = "zh_CN.UTF-8";
      #LC_NAME = "zh_CN.UTF-8";
      #LC_NUMERIC = "zh_CN.UTF-8";
      #LC_PAPER = "zh_CN.UTF-8";
      #LC_TELEPHONE = "zh_CN.UTF-8";
      #LC_TIME = "zh_CN.UTF-8";
  #};

}
