--  PluginName: nvim-cmp
--  Github: https://github.com/hrsh7th/nvim-cmp

vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- Don't show dumb unnecessary matching stuff
vim.opt.shortmess:append "c"

local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = 50,
      menu = {
        nvim_lua = "[LUA]",
        nvim_lsp = "[LSP]",
        path = "[Path]",
        luasnip = "[Snip]",
        buffer = "[Buff]",
      },
    },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

--  PluginName: nvim-autopairs
--  Github: https://github.com/windwp/nvim-autopairs
local autopairs_ready, autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if autopairs_ready then
  cmp.event:on("confirm_done", autopairs.on_confirm_done)
end
