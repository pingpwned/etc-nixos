{ pkgs, ... }:

{
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pwnedxyz = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/pwnedxyz/";
    #shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" "spotifyd" "libvirtd" ]; # additional groups [ "vboxusers" "docker"];
  };

}
