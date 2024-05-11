{ lib, ... }: {

    environment.etc."issue".source = lib.mkForce ./ascii_art;
    #users.motd = "Today is Sweetmorn, the 4th day of The Aftermath in the YOLD 3178.";
}
