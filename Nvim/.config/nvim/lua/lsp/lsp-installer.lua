local lspOk, lsp_installer = pcall(require, 'nvim-lsp-installer')
local ConfigOk, lspconfig = pcall(require, 'lspconfig')

if not lspOk or not ConfigOk then
    return
end

local servers = { "jsonls", "sumneko_lua", "eslint", "tsserver", "emmet_ls", "html", "cssls", "rust_analyzer" }

lsp_installer.setup {
    ensure_installed = servers
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = require('lsp.handlers').on_attach,
        capabilities = require('lsp.handlers').capabilities,
    }
    local hasCustom, customOpts = pcall(require, "lsp.settings." .. server)
    if hasCustom then
        opts = vim.tbl_deep_extend('force', customOpts, opts)
    end
    lspconfig[server].setup(opts)
end
