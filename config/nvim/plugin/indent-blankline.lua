--  PluginName: indent-blankline.nvim
--  Github: https://github.com/lukas-reineke/indent-blankline.nvim

local ready, indent_blankline = pcall(require, "indent_blankline")
if ready then
  indent_blankline.setup {
    show_current_context = true,
  }
end
