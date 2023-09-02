{
  config,
  pkgs,
  ...
}: {
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

      # IME
      # I use Fcitx5 and mozc to write in Japanese.
      XMODIFIERS = "@im=fcitx";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };

  # Find japanese, japanese.nix?
  time.timeZone = "Australia/Perth"; # Timezone.

  # Locale
  i18n = {
    defaultLocale = "en_US.UTF-8"; #"ja_JP.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "ja_JP.EUC-JP/EUC-JP"
      #"ja_JP.SJIS/SHIFT_JIS" # not supported, see how to add to nixos in future.
    ];
    # CUSTOM LOCALE SETTINGS
    #extraLocaleSettings = {
    #LC_MESSAGES = "en_US.UTF-8";
    #LC_TIME = "en_US.UTF-8";
    # JAPANESE
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
    #}

    # Input Method Editor (IME)
    # Fcitx5 + Mozc
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        fcitx5-configtool
        #fcitx5-lua # ?
      ];
    };
  };

  # Is this necessary?
  #environment.systemPackages = with pkgs; [ fcitx5-mozc ];
}
