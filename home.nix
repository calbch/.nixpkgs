{ config, pkgs, ... }:
{

  manual.manpages.enable = false;

  nixpkgs.config.allowUnfree = true;
  home.username = "cal";
  home.homeDirectory = "/Users/cal";
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    bat
    exa
    fd
    fzf
    ripgrep
    tealdeer
    htop
    tree
    tmux
  ];

  programs.home-manager.enable = true;
}
