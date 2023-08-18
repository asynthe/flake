{ config, pkgs, ... }:

{
  
 # Locale
  i18n = {
    defaultLocale = "en_US.UTF-8";
    #defaultLocale = "ja_JP.UTF-8";
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
    #}
  };

 # Input Method Editor - Fcitx5
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc # Input Method
      fcitx5-gtk
      fcitx5-configtool
      #fcitx5-lua # ?
    ];
  };

  # Install necessary packages.
  environment.systemPackages = with pkgs; [

    fcitx5-mozc

  ];

}
