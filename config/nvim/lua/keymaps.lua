local M = {}

local options = { noremap = true, silent = true }

local term_options = { silent = true }

-- Shorten function name
local set = vim.keymap.set

--Remap space as leader key
-- set("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
set("n", "<C-h>", "<C-w>h", options)
set("n", "<C-j>", "<C-w>j", options)
set("n", "<C-k>", "<C-w>k", options)
set("n", "<C-l>", "<C-w>l", options)

-- Resize with arrows
set("n", "<C-Up>", ":resize +2<CR>", options)
set("n", "<C-Down>", ":resize -2<CR>", options)
set("n", "<C-Left>", ":vertical resize -2<CR>", options)
set("n", "<C-Right>", ":vertical resize +2<CR>", options)

-- Navigate buffers
set("n", "<S-l>", ":bnext<CR>", options)
set("n", "<S-h>", ":bprevious<CR>", options)
set("n", "<S-w>", ":bd<CR>", options)

-- Insert --
-- Press jk fast to enter
set("i", "jk", "<ESC>", options)

-- Visual --
-- Stay in indent mode
set("v", "<", "<gv", options)
set("v", ">", ">gv", options)

-- Move text up and down
set("v", "<A-j>", ":m .+1<CR>==", options)
set("v", "<A-k>", ":m .-2<CR>==", options)
set("v", "p", '"_dP', options)

-- Visual Block --
-- Move text up and down
set("x", "J", ":move '>+1<CR>gv-gv", options)
set("x", "K", ":move '<-2<CR>gv-gv", options)

-- Terminal --
-- Better terminal navigation
set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_options)
set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_options)
set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_options)
set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_options)

-- Launch Telescope without any argument
set("n", "<C-t>", require("telescope.builtin").builtin, options)
-- search live grep
set("n", "<C-a>", require("telescope.builtin").live_grep, options)
-- show buffers/opened files
set("n", "<C-b>", require("telescope.builtin").buffers, options)
-- search git files if in repo
set("n", "<C-f>", require("telescope.builtin").find_files, options)
-- set("n", "<C-e>", require("telescope").extensions.file_browser.file_browser { path = "%:p:h" }, options)
set("n", "<C-e>", ":Telescope file_browser path=%:p:h<CR>", options)
-- open file diagnostics
set("n", "<leader>d", require("telescope.builtin").diagnostics, options)

-- LSP --
-- set("n", "<leader>e", vim.diagnostic.open_float, options)
set("n", "<leader>gd", vim.lsp.buf.definition, options)
set("n", "<leader>f", function()
  vim.lsp.buf.format { async = true }
end, options)

-- lspsaga --
set("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>", options)
set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", options)
set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", options)
set("n", "gd", "<Cmd>Lspsaga preview_definition<CR>", options)
set("n", "gr", "<Cmd>Lspsaga rename<CR>", options)
set("n", "<leader>j", "<Cmd>Lspsaga diagnostic_jump_next<CR>", options)
set("n", "<leader>k", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", options)
set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", options)
