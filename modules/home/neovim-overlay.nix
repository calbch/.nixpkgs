self: super:

let sources = import ../../nix/sources.nix;
in
{
  customVim = with self; {
    filetype-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "filetype-nvim";
      src = sources."filetype.nvim";
    };

    mason-nvim = pkgs.vimUtils.buildVimPlugin {
      dontBuild = true;
      name = "mason-nvim";
      src = sources."mason.nvim";
    };

    mason-lspconfig-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "mason-lspconfig-nvim";
      src = sources."mason-lspconfig.nvim";
    };

  };
}
