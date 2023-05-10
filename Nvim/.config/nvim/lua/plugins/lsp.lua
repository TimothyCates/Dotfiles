local ok, lsp_setup = pcall(require, "lsp-setup")
if not ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities();
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn",  text = "" },
  { name = "DiagnosticSignHint",  text = "כֿ" },
  { name = "DiagnosticSignInfo",  text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})



lsp_setup.setup({
  default_mappings = false,
  on_attach = function(client, bufnr)
    require("colorizer").attach_to_buffer()
    require("lsp-format").on_attach(client)
  end,
  capabilities = capabilities,
  servers = {
    asm_lsp = {},
    clangd = {},
    cmake = {},
    cssls = {},
    eslint = {},
    golangci_lint_ls = {},
    jdtls = {},
    lua_ls = {},
    rust_analyzer = require("lsp-setup.rust-tools").setup({
      server = {
        ['rust-analyzer'] = {
          cargo = {
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true
          }
        }
      }
    }),
    tsserver = {},
    prismals = {},
    pyre = {},
    tailwindcss = {},
  }
})
