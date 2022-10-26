{config, pkgs, ...}:

{
    programs.git = {
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
}