{ config, pkgs, ... }:

{
  services.openvpn.servers = {
    vpn = {
      config = ''
        client
        dev tap
        proto udp
       	remote example.com 123 
       	resolv-retry infinite
       	nobind
       	user nobody
       	group nogroup
       	persist-key
       	persist-tun
       	ca /etc/.vpn/
       	cert /etc/.vpn/
        key /etc/.vpn/
        tls-auth ta.key 1
       	compress
       	verb 3
       	mute 20
       	cipher AES-256-GCM
       	auth SHA256
       	script-security 3
       	remote-cert-tls server
       
       	up /etc/openvpn/update-resolv-conf
       	down /etc/openvpn/update-resolv-conf
      '';
      autoStart = false;
      updateResolvConf = true;
    };
  };
}
