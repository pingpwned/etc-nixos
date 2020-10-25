{ config, pkgs, ... }:

{
  services.postgresql = {
    enable = false;
  #  package = pkgs.postgresql_10;
  #  enableTCPIP = true;
  #  authentication = pkgs.lib.mkOverride 10 ''
  #    local all all trust
  #    host all all ::1/128 trust
  #    local shop_3 postgres trust
  #    host shop_3 postgres 127.0.0.1 255.255.255.255 trust
  #  '';
  #  initialScript = pkgs.writeText "backend-initScript" ''
  #    CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres' CREATEDB;
  #    CREATE DATABASE shop_3;
  #    GRANT ALL PRIVALEGES ON DATABASE shop_3 TO postgres;
  #  '';
  };
}
