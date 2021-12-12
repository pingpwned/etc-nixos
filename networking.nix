{ config, pkgs, ... }:

{
  networking = {
    hostName = "lamabuk";
    networkmanager = {
      enable = true;
    };
    nameservers = [ "8.8.8.8" "8.8.4.4" ];

    # Enable NAT for containers
    nat.enable = false;
    # nat.internalInterfaces = ["ve-+"];
    # nat.externalInterface = "wlp2s0";
    # networkmanager.unmanaged = [ "interface-name:ve-*" ];
    # Open ports in the firewall.
    firewall.allowedTCPPorts = [ 8000 80 ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
    extraHosts =
      ''
        127.0.0.1 local.example.com
        127.0.0.1 local.test
        192.168.1.94 nextcloud.home
      '';

    # Enable wireless support via wpa_supplicant.
    # wireless.enable = true;  

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # wireguard.interfaces = {
    #   # "wg0" is the network interface name. You can name the interface arbitrarily.
    #   wg0 = {
    #     # Determines the IP address and subnet of the client's end of the tunnel interface.
    #     ips = [ "10.0.0.3/32" ];

    #     # Path to the private key file.
    #     #
    #     # Note: The private key can also be included inline via the privateKey option,
    #     # but this makes the private key world-readable; thus, using privateKeyFile is
    #     # recommended.
    #     privateKeyFile = "~/wireguard_keys/private-us";

    #     peers = [
    #       # For a client configuration, one peer entry for the server will suffice.
    #       {
    #         # Public key of the server (not a file path).
    #         publicKey = "1rHPzeSVzX26bkbafNQ3xHTaowr1A4CCHGIR5vDRXFw=";

    #         # Forward all the traffic via VPN.
    #         allowedIPs = [ "0.0.0.0/0" ];
    #         # Or forward only particular subnets
    #         #allowedIPs = [ "10.100.0.1" "91.108.12.0/22" ];

    #         # Set this to the server IP and port.
    #         endpoint = "143.110.155.37:51820";

    #         # Send keepalives every 25 seconds. Important to keep NAT tables alive.
    #         persistentKeepalive = 25;
    #       }
    #     ];
    #   };
    # };

    # US interface
    # wg-quick.interfaces = {
    #   wg0 = {
    #     address = [ "10.0.0.3/32" ];
    #     # dns = [ "10.0.0.1" ];
    #     dns = [ "8.8.8.8" ];
    #     privateKeyFile = "/home/pwnedxyz/wireguard_keys/private-us";

    #     peers = [
    #       {
    #         publicKey = "1rHPzeSVzX26bkbafNQ3xHTaowr1A4CCHGIR5vDRXFw=";
    #         allowedIPs = [ "0.0.0.0/0" "::/0" ];
    #         endpoint = "143.110.155.37:51820";
    #         persistentKeepalive = 25;
    #       }
    #     ];
    #   };
    # };

  };
}
