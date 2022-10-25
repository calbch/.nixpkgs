{ config, pkgs, ... }:
{
  imports = [
    (import ./home/alacritty.nix)
    (import ./home/nvim.nix)
  ];

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

    shellAliases = {
      ls = "exa -aF --group-directories-first --color=always --icons";
      la = "exa -alF --group-directories-first --color=always --icons";
      ll = "exa -lF --group-directories-first";
      lt = "exa -aTF --level=2 --group-directories-first --icons --color=always";
      ldot = "exa -a | egrep ''\"^\.''\"";
      cat = "bat";
      grep = "ripgrep";
    };
  };

  programs = {
    # allow Home Manager to install and manage itself
    home-manager.enable = true;

    zsh = {
      enable = true;
      enableAutosuggestions = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "tmux" "" ];
      };
    };

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
          threshold = 80;
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
