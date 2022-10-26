{ config, pkgs, ... }:

{
  # Programs
  import ./modules/home/alacritty.nix;
  programs.bat.enable = true;
  programs.exa.enable = true;
  programs.fzf.enable = true;
  import ./modules/home/git.nix;
  programs.home-manager.enable = true; # allow home-manager to manage itself
  programs.htop.enable = true;
  programs.lazygit.enable = true;
  import ./modules/home/neovim.nix;
  import ./modules/home/starship.nix;
  programs.tealdeer.enable = true;
  import ./modules/home/tmux.nix;
  programs.zoxide.enable = true;
  import ./modules/home/zsh.nix;

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
