{ config, lib, ... }:
with lib; with types;
let
    cfg = config.framework.system;
in {
    options.framework.system.language = mkOption {
        type = str;
        default = "english";
    };
    config = {
    
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
