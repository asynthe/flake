{ config, lib, ... }:

with lib;

let

    cfg_english = config.language.english;
    cfg_japanese = config.language.japanese;

in {

    options.language.english.enable = mkOption {
        type = types.bool;
        default = true;
        description = "Set up english locale-only.";
    };

    options.language.japanese.enable = mkOption {
        type = types.bool;
        default = true;
        description = "日本語を設定する。";
    };

    config = mkMerge [
        (mkIf (cfg_english.enable) {
            i18n = {
                defaultLocale = "en_US.UTF-8";
                supportedLocales = [ "en_US.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
            };
        })
        (mkIf (cfg_japanese.enable) {

            # ADD
            # Japanese fonts
            # IME

            time.timeZone = lib.mkForce "Asia/Tokyo";
            i18n = {
                defaultLocale = lib.mkForce "ja_JP.UTF-8";
                extraLocaleSettings.LC_ALL = "ja_JP.UTF-8"; # This one overrides all.
                #supportedLocales = [
                    #"ja_JP.EUC-JP/EUC-JP"
                    #"en_US.UTF-8/UTF-8"
                    #"ja_JP.SJIS/SHIFT_JIS" # Not supported.
                #];
            };
        })
    ];
} 
