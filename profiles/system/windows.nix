{ config, lib, pkgs, ... }: 
with lib; with types;
let
    cfg = config.meta.system;
in {
    options.meta.system = {
        windows = mkEnableOption "Enable setup for Windows dual-boot or access.";
    };

    config = mkIf cfg.windows {

        time.hardwareClockInLocalTime = true;
        environment.systemPackages = builtins.attrValues {
            inherit (pkgs)
                ntfs3g
            ;
        };
    };
}
