{ config, pkgs, ... }: {

  time.timeZone = "Asia/Tokyo";

  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.EUC-JP/EUC-JP"
      #"ja_JP.SJIS/SHIFT_JIS" # Not supported, see how to add to NixOS in future.
      ];

    extraLocaleSettings = {
      LC_MESSAGES = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
    };
  };

}
