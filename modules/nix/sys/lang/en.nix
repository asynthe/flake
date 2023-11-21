{ config, pkgs, ... }: 

let

  ENGLISH = "en_US.UTF-8/UTF-8";
  JAPANESE = "ja_JP.UTF-8/UTF-8";
  GERMAN = "de_DE.UTF-8/UTF-8";

in {

  time.timeZone = "Australia/Perth";

  i18n = {
    defaultLocale = "en_US.UTF-8/UTF-8";
    supportedLocales = [
      "ja_JP.UTF-8/UTF-8"
      "ja_JP.EUC-JP/EUC-JP"
    ];

   extraLocaleSettings = {
     LANG = "ENGLISH";
     LC_MESSAGES = "ENGLISH";
     LC_IDENTIFICATION = "ENGLISH";
     LC_ALL = "ENGLISH"; # This replaces all the other ones.

   #  LC_CTYPE = "en_US.UTF-8";
   #  LC_NUMERIC = "en_US.UTF-8";
   #  LC_TIME = "en_US.UTF-8";
   #  LC_COLLATE = "en_US.UTF-8";
   #  LC_NAME = "en_US.UTF-8";
   #  LC_MONETARY = "en_US.UTF-8";
   #  LC_PAPER = "en_US.UTF-8";
   #  LC_ADDRESS = "en_US.UTF-8";
   #  LC_TELEPHONE = "en_US.UTF-8";
   #  LC_MEASUREMENT = "en_US.UTF-8";
   };
  };

}
