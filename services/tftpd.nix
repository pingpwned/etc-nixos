{ config, pkgs, ... }:
{
  # tftpd
  services.atftpd = {
    enable = false;
  #  extraOptions = [
  #    "--bind-address 192.168.0.66"
  #  ];
  #  root = /home/pwnedxyz/tftpd;
  };
}
