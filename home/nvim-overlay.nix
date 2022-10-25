self: super:
let sources = import ../nix/sources.nix;
in
{
  customVim = with self; {
    filetype-nvim = pkgs.vimPlugins.buildVimPlugin {
      name = "filetype-nvim";
      src = sources."filetype.nvim";
    };

    mason-lspconfig-nvim = pkgs.vimPlugins.buildVimPlugin {
      name = "mason-lspconfig-nvim";
      src = sources."mason-lspconfig.nvim";
    };

    mason-nvim = pkgs.vimPlugins.buildVimPlugin {
      name = "mason-nvim";
      src = sources."mason.nvim";
    };

  };

  # customLsp = with self; {
  #   prettierd = pkgs.nodePackages
  #   };
}
