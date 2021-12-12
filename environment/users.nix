{ pkgs, ... }:

{
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pwnedxyz = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/pwnedxyz/";
    #shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" "spotifyd" "libvirtd" "www-data" ]; # additional groups [ "vboxusers" "docker"];
  };

   users.extraUsers."www-data" = {
      uid = 33;
      group = "www-data";
      home = "/srv/www";
      createHome = true;
      useDefaultShell = true;
    };
    users.extraGroups."www-data".gid = 33;


}
