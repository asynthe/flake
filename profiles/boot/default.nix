{
    imports = [

        # Un-opinionized configuration
        ./files/systemd-boot.nix

        # Working
        ./banner.nix 

        # Not working, yet
        #./boot.nix
        ./silent.nix
        #./tmp.nix
    ];
}
