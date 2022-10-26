{ config, pkgs, ... }:

{
  documentation.enable = false;

  security.pam.enableSudoTouchIdAuth = true;

  imports import ./modules/darwin/defaults.nix;

  nix.package = pkgs.nixFlakes;

  environment.shells = [ pkgs.zsh ];

  # Services
  services.nix-daemon.enable = true;
  import ./modules/darwin/wm.nix; # Window Management

  # Programs
  # mostly managed in home.nix

  # Homebrew
  import ./modules/darwin/brew.nix;

  # Users
  users.users.cal = {
    name = "cal";
    home = "/Users/cal";
    shell = pkgs.zsh;
  };
}
