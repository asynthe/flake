{ config, lib, ... }:
with lib;
let
    cfg = config.boot.banner;
in {

    options.boot.banner = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Enable and specify a banner on device login.";
    };

    #users.motd = "Today is leg day.";

    config = mkIf (cfg != null) {

        environment.etc."issue".source = lib.mkForce (
            if cfg == "simple_cat" then ./banner/simple_cat
            #else if cfg == "" then ./banner/.
            #else if cfg == "" then ./banner/.
            #else if cfg == "" then ./banner/.
            else throw "Specified banner is not on the options list."
        );
    };
}
