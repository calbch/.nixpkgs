{config, pkgs, ...}:

{
    programs.starship = {
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
}