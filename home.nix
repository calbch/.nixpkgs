{ config, pkgs, ... }:

{
  nix.package = pkgs.nixFlakes;
  nix.extraOptions="experimental-features = nix-command flakes";

  programs = {
    bat.enable = true;
    exa.enable = true;
    fzf.enable = true;
    home-manager.enable = true; # allow home-manager to manage itself
    htop.enable = true;
    lazygit.enable = true;
    tealdeer.enable = true;
    zoxide.enable = true;
  };

  imports = [
    ./modules/home/alacritty.nix
    ./modules/home/neovim.nix
    ./modules/home/starship.nix
    ./modules/home/tmux.nix
    ./modules/home/zsh.nix
  ];

  home = {
    stateVersion = "22.05";
    packages = with pkgs; [
      fd
      # TODO: currently broken
      # ripgrep
      tree
      luajit
      stow
    ];
  };
}
