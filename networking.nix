{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    hostName = "nixos";
    firewall.allowPing = true;

    nameservers = [
      "67.207.67.3"
      "67.207.67.2"
    ];
    defaultGateway = "46.101.128.1";
    defaultGateway6 = "2a03:b0c0:3:d0::1";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="46.101.184.41"; prefixLength=18; }
{ address="10.19.0.5"; prefixLength=16; }
        ];
        ipv6.addresses = [
          { address="2a03:b0c0:3:d0::e81:2001"; prefixLength=64; }
{ address="fe80::6c1b:7bff:fe3e:48db"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "46.101.128.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = "2a03:b0c0:3:d0::1"; prefixLength = 32; } ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="6e:1b:7b:3e:48:db", NAME="eth0"
    ATTR{address}=="22:98:87:41:15:ba", NAME="eth1"
  '';
}
