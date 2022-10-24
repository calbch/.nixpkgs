-- Defaults
local M = {}

-- https://github.com/folke/tokyonight.nvim
M.use_tokyonight = function()
  local ready, _ = pcall(require, "tokyonight")
  if not ready then
    vim.notify "Tokyonight is not installed"
    return
  end
  M.active_theme = "tokyonight"
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_transparent_sidebar = true
  vim.cmd [[colorscheme tokyonight]]
end

-- https://github.com/catppuccin/nvim
M.use_catppuccin = function()
  local ready, catppuccin = pcall(require, "catppuccin")
  if not ready then
    vim.notify "Catpuccin is not installed"
    return
  end
  M.active_theme = "catppuccin"
  vim.g.catppuccin_flavour = "macchiato"
  catppuccin.setup {
    transparent_background = true,
    integrations = {
      lsp_saga = true
    }
  }
  vim.cmd [[colorscheme catppuccin]]
end

return M
