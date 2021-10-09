{ config, pkgs, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # As GnuPG is now built without support for a graphical passphrase entry by default 
  programs.gnupg.agent.enable = true;

}
