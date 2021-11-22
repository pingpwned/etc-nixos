{ config, pkgs, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # As GnuPG is now built without support for a graphical passphrase entry by default 
  programs.gnupg.agent.enable = true;
  programs.fish.enable = false;
  programs.dconf.enable = true;
  programs.bash.shellInit = ''
    parse_git_branch () {
      pwd | /usr/bin/grep $ssh_mount_dir &>/dev/null && df -h | /usr/bin/grep $(pwd | /usr/bin/grep $ssh_mount_dir.*[^/]) | awk '{print $1}' 2> /dev/null || echo $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (branch:\1)/')
    }

    parse_git_tag () {
      git describe --tags 2> /dev/null
    }

    parse_git_branch_or_tag() {
      local OUT="$(parse_git_branch)"
      if [ "$OUT" == " ((no branch))" ]; then
        OUT="(tag:$(parse_git_tag))";
      fi
      echo $OUT
    }


    PS1="\[\033]0;\u:$/{PWD##*/}\007\]\[\e[0;32m\]\u\[\e[m\]\[\e[0;32m\]@\h\[\e[m\] \[\e[0;36m\][\t]\[\e[m\] \[\e[0;32m\]$(parse_git_branch_or_tag)\[\e[m\]\n\[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]"
  '';
}
