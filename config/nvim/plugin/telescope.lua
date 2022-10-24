--  PluginName: telescope.nvim
--  Github: https://github.com/nvim-telescope/telescope.nvim
-- :help telescope.setup()
--  PluginName: telescope-fzf-native.nvim
--  Github: https://github.com/nvim-telescope/telescope-fzf-native.nvim
--  PluginName: telescope-file-browser.nvim
--  Github: https://github.com/nvim-telescope/telescope-file-browser.nvim
local set = vim.keymap.set
local options = { noremap = true, silent = true }
local telescope_ready, telescope = pcall(require, "telescope")
if not telescope_ready then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    color_devicons = true,
    file_ignore_patterns = {
      "__pycache__/",
      "__pycache__/*",
      "build/",
      "env/",
      "node_modules/",
      "node_modules/*",
      ".git/",
      ".github/",
      ".vscode/",
      "%.ipynb",
      "%.zip",
      "%.tar",
    },
  },
  mappings = {
    -- check https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
    -- for all the default mapping
    i = {},
    n = {},
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      hijack_netrw = true,
      grouped = true,
    },
  },
}

telescope.load_extension "fzf"
telescope.load_extension "file_browser"


-- customs
local list_project_files = function()
  local options = {}
  local ready = pcall(require("telescope.builtin").git_files, options)
  if not ready then
    require("telescope.builtin").find_files(options)
  end
end
