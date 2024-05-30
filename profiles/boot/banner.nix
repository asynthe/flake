{ config, lib, ... }:
with lib;
let
    cfg = config.boot.banner;
in {
    options.boot.banner.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable banner on device login.";
    };

    config = mkIf cfg.enable {

        # simple_cat
        environment.etc."issue".source = lib.mkForce ./banner/cat;
        #users.motd = "Today is Sweetmorn, the 4th day of The Aftermath in the YOLD 3178.";
    };
}
