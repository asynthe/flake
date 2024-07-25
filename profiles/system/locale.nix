{ config, lib, ... }:
with lib;
let
    cfg = config.system.locale;
in {

    /*
    Should I enable IME?
    */

    options.system.locale = mkOption {
        type = types.str;
        default = "english";
        description = "Set up the system locale.";
    };

    config = mkMerge [
        (mkIf (cfg == "both") {
            i18n = {
                defaultLocale = "en_US.UTF-8";
                supportedLocales = [
                    "en_US.UTF-8/UTF-8"
                    "ja_JP.UTF-8/UTF-8"
                    "ja_JP.EUC-JP/EUC-JP"
                ];
            };
        })
        (mkIf (cfg == "english") {
            #environment.variables.LOCALE_ARCHIVE = lib.mkForce true; "${pkgs.glibcLocales}/lib/locale/locale-archive";
            i18n = {
                defaultLocale = "en_US.UTF-8";
                #extraLocaleSettings = {
                    #LC_ALL = "en_US.UTF-8"; # This replaces all the other ones.
                    #LC_ALL = "";
                    #LANGUAGE = "en_US.UTF-8";
                    #LANG = "en_US.UTF-8";
                    #LC_MESSAGES = "en_US.UTF-8";
                    #LC_IDENTIFICATION = "en_US.UTF-8";

                    #LC_CTYPE = "en_US.UTF-8/UTF-8";
                    #LC_NUMERIC = "en_US.UTF-8/UTF-8";
                    #LC_TIME = "en_US.UTF-8/UTF-8";
                    #LC_COLLATE = "en_US.UTF-8/UTF-8";
                    #LC_NAME = "en_US.UTF-8/UTF-8";
                    #LC_MONETARY = "en_US.UTF-8/UTF-8";
                    #LC_PAPER = "en_US.UTF-8/UTF-8";
                    #LC_ADDRESS = "en_US.UTF-8/UTF-8";
                    #LC_TELEPHONE = "en_US.UTF-8/UTF-8";
                    #LC_MEASUREMENT = "en_US.UTF-8/UTF-8";
                #};
            };
        })
        (mkIf (cfg == "japanese") {
            time.timeZone = mkForce "Asia/Tokyo";
            i18n = {
                defaultLocale = "ja_JP.UTF-8";
                supportedLocales = [
                    "en_US.UTF-8/UTF-8"
                    "ja_JP.EUC-JP/EUC-JP"
                    #"ja_JP.SJIS/SHIFT_JIS" # Not supported, see how to add to NixOS in future.
                ];
                extraLocaleSettings = {
                    LC_ALL = "ja_JP.UTF-8"; # This one overrides all.
                    #LC_MESSAGES = "ja_JP.UTF-8";
                    #LC_TIME = "ja_JP.UTF-8";
                    #LC_ADDRESS = "ja_JP.UTF-8";
                    #LC_IDENTIFICATION = "ja_JP.UTF-8";
                    #LC_MEASUREMENT = "ja_JP.UTF-8";
                    #LC_MONETARY = "ja_JP.UTF-8";
                    #LC_NAME = "ja_JP.UTF-8";
                    #LC_NUMERIC = "ja_JP.UTF-8";
                    #LC_PAPER = "ja_JP.UTF-8";
                    #LC_TELEPHONE = "ja_JP.UTF-8";
                };
            };
        })
    ];
}

#let
#    cfg_english = config.language.english;
#    cfg_japanese = config.language.japanese;
#in {
#    options.language.english.enable = mkOption {
#        type = types.bool;
#        default = true;
#        description = "Set up english locale-only.";
#    };
#    options.language.japanese.enable = mkOption {
#        type = types.bool;
#        default = true;
#        description = "日本語を設定する。";
#    };
#    config = mkMerge [
#        (mkIf (cfg_english.enable) {
#            i18n = {
#                defaultLocale = lib.mkForce "en_US.UTF-8";
#                supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
#                extraLocaleSettings.LC_ALL = lib.mkForce "en_US.UTF-8";
#            };
#        })
#        (mkIf (cfg_japanese.enable) {
#            time.timeZone = lib.mkForce "Asia/Tokyo";
#            i18n = {
#                defaultLocale = "ja_JP.UTF-8";
#                supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
#                extraLocaleSettings.LC_ALL = "ja_JP.UTF-8"; # This one overrides all.
                #supportedLocales = [
                    #"ja_JP.EUC-JP/EUC-JP"
                    #"en_US.UTF-8/UTF-8"
                    #"ja_JP.SJIS/SHIFT_JIS" # Not supported.
                #];
#            };
#        })
#    ];
#} 
