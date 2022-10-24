--  PluginName: mason-lspconfig.nvim
--  Github: https://github.com/williamboman/mason-lspconfig.nvim
--  PluginName: nvim-lspconfig
--  Github: https://github.com/neovim/nvim-lspconfig

local brige_ready, bridge = pcall(require, "mason-lspconfig")
require("neodev").setup {}
local config_ready, config = pcall(require, "lspconfig")
if not config_ready and not brige_ready then
  return
end

local lsp = vim.lsp
local handlers = lsp.handlers

bridge.setup {
  ensure_installed = {
    "jsonls",
    "sumneko_lua",
    "cssls",
    "tailwindcss",
    "html",
    "tsserver",
    "rust_analyzer"
  },
}
bridge.setup_handlers {
  -- use custom language server settings if specified in /servers
  function(server_name)
    config[server_name].setup {}
  end,

  ["jsonls"] = function()
    config.jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end,

  ["sumneko_lua"] = function()
    config.sumneko_lua.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          },
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";")
          },
          format = {
            enable = false,
          },
          globals = { "vim" },
          workspace = {
            library = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
          telemetry = { enable = false },
        },
      },
    })
  end,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

config.util.default_config = vim.tbl_extend("force", config.util.default_config, {
  -- on_attach = function () end,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
})

handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 3,
    prefix = "⌲"
  }
})
