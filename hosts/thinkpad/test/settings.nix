{ config, lib, ... }:
with lib;
{
    options = {
        system.name
        user.name
    };
}
