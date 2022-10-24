--  PluginName: null-ls
--  Github: https://github.com/hrsh7th/nvim-cmp

local ready, null_ls = pcall(require, "null-ls")
if not ready then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
  sources = {
    formatting.stylua.with {
      extra_args = { "--config-path", vim.fn.expand "~/.config/nvim/stylua.toml" },
    },
    formatting.prettierd,
    diagnostics.eslint_d,
    -- formatting.eslint_d,
    -- code_actions.eslint_d,
  },
}
