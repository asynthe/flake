{ config, lib, ... }: {
#with lib;
#let
    #cfg = config.meta.disk.encryption;
#in {
    boot.initrd.luks.devices.encrypted.preLVM = true;
    #boot.initrd.preLVMCommands = mkIf (cfg.message == "dice") ''
    boot.initrd.preLVMCommands = ''
echo '    _______             '
echo '  /\       \            '
echo ' /()\   ()  \           '
echo '/    \_______\          '
echo '\    /()     /          '
echo ' \()/   ()  /           '
echo '  \/_____()/            '
echo 'This device is property of missingno'
echo 'If lost please contact missingno@waifu.club'
    '';
}
