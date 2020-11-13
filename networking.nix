{ pkgs, lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    hostName = "nixos";
    
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };

    firewall = {
      allowPing = false;
      allowedTCPPorts = [ 53 ];
      allowedUDPPorts = [ 53 51820 ];
    };
   
    nameservers = [
      "67.207.67.3"
      "67.207.67.2"
    ];

    extraHosts =
      ''
        127.0.0.1 local.example.com
        10.0.0.4 nextcloud.home
      '';

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

    wg-quick.interfaces = {
      # "wg0" is the network interface name. You can name the interface arbitrarily.
      wg0 = {
        # Determines the IP address and subnet of the server's end of the tunnel interface.
        address = [ "10.0.0.1/24" "fdc9:281f:04d7:9ee9::1/64" ];
  
        # The port that Wireguard listens to. Must be accessible by the client.
        listenPort = 51820;
  
        # Path to the private key file.
        #
        # Note: The private key can also be included inline via the privateKey option,
        # but this makes the private key world-readable; thus, using privateKeyFile is
        # recommended.
        privateKeyFile = "/root/wireguard-keys/private";
         # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
         postUp = ''
           ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
           ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.1/24 -o eth0 -j MASQUERADE
           ${pkgs.iptables}/bin/ip6tables -A FORWARD -i wg0 -j ACCEPT
           ${pkgs.iptables}/bin/ip6tables -t nat -A POSTROUTING -s fdc9:281f:04d7:9ee9::1/64 -o eth0 -j MASQUERADE
         '';

         # Undo the above
         preDown = ''
           ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
           ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.1/24 -o eth0 -j MASQUERADE
           ${pkgs.iptables}/bin/ip6tables -D FORWARD -i wg0 -j ACCEPT
           ${pkgs.iptables}/bin/ip6tables -t nat -D POSTROUTING -s fdc9:281f:04d7:9ee9::1/64 -o eth0 -j MASQUERADE
         '';
        peers = [
          # List of allowed peers.
          
          # Android
          {
            publicKey = "NbrZuZAhRDvcrRNU7LPbAf6ffNuzaGdHffgwKtAd3E4=";
            allowedIPs = [ "10.0.0.3/32" "fdc9:281f:04d7:9ee9::3/128" ];
          }

          #opi
          {
            publicKey = "p9cqIKYLd+oNukqjVddm/dagDf2u/RPBjt1ny3gcgTE=";
            allowedIPs = [ "10.0.0.4/32" "fdc9:281f:04d7:9ee9::4/128" ]; 
          }
        ];
      };
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="6e:1b:7b:3e:48:db", NAME="eth0"
    ATTR{address}=="22:98:87:41:15:ba", NAME="eth1"
  '';
}
