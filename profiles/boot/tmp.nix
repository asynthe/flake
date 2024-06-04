{
    #options.system.boot.cleantmp = mkOption {
        #type = types.bool;
        #default = false;
        #description = ''
          #Clean /tmp on reboot.
        #'';
    #};
    
    #tmp = mkIf cfg.cleantmp {
        #cleanOnBoot = true;
        #useTmpfs = true;
        #tmpfsSize = "20%"; # default `"50%"`.
    #};
}
