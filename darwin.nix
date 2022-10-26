{ config, pkgs, ... }:

{
  documentation.enable = false;
  security.pam.enableSudoTouchIdAuth = true;
  environment.shells = [ pkgs.zsh ];
  services.nix-daemon.enable = true;

  programs.tmux = {
    enable = true;
    enableFzf = true;
    enableSensible = true;
    enableVim = true;
  };

  imports = [ 
    ./modules/darwin/defaults.nix   # System Defaults & Settings
    ./modules/darwin/wm.nix         # Window Management
    ./modules/darwin/brew.nix       # Homebrew Packages
     ];

  # Users
  users.users.cal = {
    name = "cal";
    home = "/Users/cal";
    shell = pkgs.zsh;
  };
}
