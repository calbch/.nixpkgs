--  PluginName: nvim-ts-autotag
--  Github: https://github.com/windwp/nvim-ts-autotag
local autotag_ready, autotag = pcall(require, "nvim-ts-autotag")
if autotag_ready then
  autotag.setup()
end
