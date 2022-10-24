--  PluginName: treesitter.nvim
--  Github: https://github.com/nvim-treesitter/nvim-treesitter.nvim

local ready, treesitter = pcall(require, "nvim-treesitter.configs")
if not ready then
  return
end

treesitter.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
