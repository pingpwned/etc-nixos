#{ config, pkgs, ... }:
{vim_configurable, pkgs}:

#{
#  environment.systemPackages = with pkgs; [
    vim_configurable.customize {
       # Specifies the vim binary name.
       # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
       # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
       name = "vi";
       vimrcConfig.customRC = ''
         syntax enable
         set backspace=2 " make backspace work like most other programs
         set tabstop=2
         set noautoindent
         set nocindent
         set nosmartindent
         set nu
         set indentexpr=
         let g:netrw_banner = 0
         let g:netrw_liststyle = 3
         let g:netrw_browse_split = 1
         let g:netrw_altv = 5
         let g:netrw_winsize = 25
         augroup ProjectDrawer
           autocmd!
           autocmd VimEnter * :Vexplore
         augroup END

       '';
       # Use the default plugin list shipped with nixpkgs
       vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
       vimrcConfig.vam.pluginDictionaries = [
         { names = [
         # Here you can place all your vim plugins
         # They are installed managed by `vam` (a vim plugin manager)
         "Syntastic"
         "ctrlp"
         ]; }
       ];
    }
#  ];
#}
