--  PluginName: lspsaga.nvim
--  Github: https://github.com/glepnir/lspsaga.nvim

local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = "typescript",
  },
}
