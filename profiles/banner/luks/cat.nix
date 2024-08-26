{ config, lib, ... }:
with lib;
let
    cfg = config.meta.disk.encryption;
in {
    config = mkIf (cfg.message == "cat") {
        boot.initrd.luks.devices.encrypted.preLVM = true;
        boot.initrd.preLVMCommands = ''
echo "    _                ___       _.--."
echo "    \`.|\..----...-'`   `-._.-'_.-'`"
echo "    /  ' `         ,       __.--'"
echo "    )/' _/     \   `-_,   /"
echo "    `-'""\_  ,_.-;_.-\_ ',     fsc/as"
echo "        _.-'_./   {_.'   ; /"
echo "       {_.-``-'         {_/"
echo "This device is property of missingno"
echo "If lost please contact missingno@waifu.club"
        '';
    };
}
