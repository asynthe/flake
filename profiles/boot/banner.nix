{ config, lib, ... }:
with lib; with types;
let
    cfg = config.meta.boot;
in {
    options.meta.boot.banner = mkOption {
        type = nullOr str;
        default = null;
        description = "Enable and specify a banner on device login.";
    };

    #users.motd = "Today is leg day.";
    config = mkIf (cfg.banner != null) {
        environment.etc."issue".source = lib.mkForce (
            if cfg.banner == "simple_cat" then ./banner/simple_cat
            #else if cfg.banner == "" then ./banner/.
            #else if cfg.banner == "" then ./banner/.
            #else if cfg.banner == "" then ./banner/.
            else throw "Specified banner is not on the options list."
        );
    };
}
