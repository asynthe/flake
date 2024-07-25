{ config, lib, ... }:
with lib;
let
    cfg = config.system.configuration;
in {
    options.system.configuration = with types; {
        user = mkOption { type = str; };
        disk = mkOption { type = str; };
        type = mkOption {
            type = str;
            default = "server";
        };
        language = mkOption {
            type = str;
            default = "english";
        };
    };

    config = {

        # I'll probably use a wm of some kind.
        hardware.graphics.enable = mkIf (cfg.type == "laptop") true;

        # 東京の時間 - Tokyo timezone.
        time.timeZone = mkDefault (mkIf (cfg.language == "japanese") "Asia/Tokyo");

        i18n = mkMerge [
            # Both
            (mkIf (cfg.language == "both") {
                defaultLocale = "en_US.UTF-8";
                supportedLocales = [
                    "en_US.UTF-8/UTF-8"
                    "ja_JP.UTF-8/UTF-8"
                    "ja_JP.EUC-JP/EUC-JP"
                ];
            })
            # English
            (mkIf (cfg.language == "english") {
                defaultLocale = "en_US.UTF-8";
                #extraLocaleSettings = {
                    # Set up here custom locale settings.
                #}
            })
            # 日本語
            (mkIf (cfg.language == "japanese") {
                defaultLocale = "ja_JP.UTF-8";
                supportedLocales = [
                    "en_US.UTF-8/UTF-8"
                    "ja_JP.EUC-JP/EUC-JP"
                ];
                #extraLocaleSettings = {
                    #LC_ALL = "ja_JP.UTF-8"; # This one overrides all.
                #};
            })
        ];
    };
}
