--  PluginName: mason.nvim
--  Github: https://github.com/williamboman/mason.nvim

local ready, mason = pcall(require, "mason")
if not ready then
  return
end

mason.setup {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}
