local options = {
  number = true, -- print the line number in front of each line
  relativenumber = true, -- show relative line number in front of each line
  numberwidth = 4, -- number of columns used for the line number {default 4}

  errorbells = false, -- ring the bell for error messages

  tabstop = 2, -- number of spaces that <Tab> in file uses
  softtabstop = 2, -- number of spaces that <Tab> uses while editing
  shiftwidth = 2, -- number of spaces to use for (auto)indent step
  expandtab = true, -- use spaces when <Tab> is inserted

  smartindent = true, -- do I need this?

  wrap = false, -- long lines wrap and continue on the next line

  swapfile = false, --  whether to use a swapfile for a buffer
  backup = false, -- keep backup file after overwriting a file
  -- undodir = os.getenv("HOME") .. "/.nvim/undodir", -- where to store undo files
  -- undofile = true, -- save undo information in a file

  hlsearch = false, -- highlight matches with last search pattern
  incsearch = true, -- highlight match while typing search pattern

  termguicolors = true, -- set term gui colors (most terminals support this)

  scrolloff = 8, -- minimum nr. of lines above and below cursor
  signcolumn = "yes", -- when and how to display the sign column

  cmdheight = 1, -- number of lines to use for the command-line

  updatetime = 50, --  after this many milliseconds flush swap file; faster completion (4000ms default)

  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  conceallevel = 0, -- so that `` is visible in markdown files

  pumheight = 10, -- pop up menu height
  showmode = false, -- we don"t need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- sidescrolloff = 8,
  guifont = "MonoLisa Nerd Font:h12", -- the font used in graphical neovim applications
}

vim.opt.isfname:append "@-@"

for k, v in pairs(options) do
  vim.opt[k] = v
end
