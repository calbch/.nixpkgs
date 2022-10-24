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
      zoxide
      htop
      tree
      tmux
      luajit
      lazygit
      stow
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

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        cmd_duration = {
          disabled = true;
        };

        memory_usage = {
          disabled = false;
          format = "\[RAM Usage: [''\${ram_pct}]($style)\] ";
          treshhold = 80;
          style = "208";
        };

        lua = {
          format = "using [ $symbol ] ($style) ";
          symbol = "";
        };
      };
    };

  };
}
