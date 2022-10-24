{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;

  home = {
    stateVersion = "22.05";
    packages = with pkgs; [
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
  };

  programs = {
    # allow Home Manager to install and manage itself
    home-manager.enable = true;

    git = {
      enable = true;
      aliases = { };
      extraConfig = {
        pull.rebase = true;
      };
      ignores = [
        ".DS_STORE"
        ".Spotlight-V100"
        ".Trashes"
        "*.pyc"
        "*.out"
        "venv"
        "node_modules"
      ];
      userEmail = "caldotdev@proton.me";
      userName = "caldotdev";
    };

    alacritty = {
      enable = true;
      settings = (import ./home/alacritty.nix);
    };

  };
}
