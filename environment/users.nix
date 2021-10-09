{ ... }:

{
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pwnedxyz = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/pwnedxyz/";
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ]; # additional groups [ "vboxusers" "docker"];
  };

}
