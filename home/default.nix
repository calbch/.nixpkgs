{ config, pkgs, lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./nvim.nix
  ];
}
