{ lib, ... }: {

    # CONFIG
    # Thinkpad -> system.thinkpad.banner = true;
    # Server -> system.server.banner = true;

    # Thinkpad
    environment.etc."issue".source = lib.mkForce ./banner/cat;
    #users.motd = "Today is Sweetmorn, the 4th day of The Aftermath in the YOLD 3178.";
}
