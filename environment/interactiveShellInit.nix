{ config, pkgs, ... }:

{
  # Enabling unfree packages, adding unstable channel and install latest python-trezor
  environment.interactiveShellInit = ''
    if [ ! -f ~/.config/nixpkgs/config.nix ]
      then
        mkdir -p ~/.config/nixpkgs/
        echo  '{ allowUnfree = true; }' > ~/.config/nixpkgs/config.nix
    fi

    if [ ! -d /nix/var/nix/profiles/per-user/$USER/channels/unstable ]
      then
        nix-channel --add https://nixos.org/channels/nixos-unstable unstable && nix-channel --update
    fi
    
    PS1="\[\033]2;\h:\u:\w\007\]\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\]";
   
    alias cdshop="cd ~/Develop/SHOPIFY/sl-shopify"
  
    '';

}
