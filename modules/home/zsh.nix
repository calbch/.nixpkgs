{ config, pkgs, ...}:

{
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "tmux" "" ];
      };

      shellAliases = {
      ls = "exa -aF --group-directories-first --color=always --icons";
      la = "exa -alF --group-directories-first --color=always --icons";
      ll = "exa -lF --group-directories-first";
      lt = "exa -aTF --level=2 --group-directories-first --icons --color=always";
      ldot = "exa -a | egrep ''\"^\.''\"";
      cat = "bat";
      grep = "egrep";
    };
    };
}