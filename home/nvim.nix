{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;

    plugins = with pkgs; [
      vimPlugins.impatient-nvim
      vimPlugins.plenary-nvim
      vimPlugins.popup-nvim

      # Treesitter
      vimPlugins.nvim-treesitter
      vimPlugins.nvim-autopairs
      vimPlugins.nvim-ts-autotag

      # LSP
      vimPlugins.nvim-lspconfig
      vimPlugins.SchemaStore-nvim
      vimPlugins.neodev-nvim
      vimPlugins.null-ls-nvim
      vimPlugins.lspsaga-nvim

      # Completion
      vimPlugins.nvim-cmp
      vimPlugins.luasnip
      vimPlugins.cmp_luasnip
      vimPlugins.cmp-nvim-lua
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-buffer
      vimPlugins.cmp-path
      vimPlugins.lspkind-nvim

      # Telescope
      vimPlugins.telescope-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-file-browser-nvim

      # Theming
      vimPlugins.nvim-web-devicons
      vimPlugins.tokyonight-nvim
      vimPlugins.catppuccin-nvim

      # Other
      vimPlugins.lualine-nvim
      vimPlugins.vim-bufferline
      vimPlugins.indent-blankline-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.indent-blankline-nvim
      vimPlugins.presence-nvim

      # Customs
      # customVim.filetype-nvim
      # customVim.mason-nvim
      # customVim.mason-lspconfig-nvim
    ];

    extraPackages = with pkgs; [
      rust-analyzer
      sumneko-lua-language-server
      stylua
      rnix-lsp
      nodePackages."eslint_d"
      nodePackages."typescript-language-server"
      nodePackages."@tailwindcss/language-server"
      # customVim.prettierd
    ];
  };

  home.file."nvim" = {
    source = ../config/nvim;
    recursive = true;
    target = "/Users/cal/.config/nvim";
  };
}
