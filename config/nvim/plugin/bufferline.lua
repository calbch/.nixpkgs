--  PluginName: bufferline.nvim
--  Github: https://github.com/akinsho/bufferline.nvim

local ready, bufferline = pcall(require, "bufferline")
if not ready then
  return
end

bufferline.setup {}
