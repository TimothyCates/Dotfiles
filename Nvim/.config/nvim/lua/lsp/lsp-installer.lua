local lsp_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
local coq_ok, coq = pcall(require, 'coq')

if not lsp_ok or not coq_ok then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('lsp.handlers').on_attach,
        capabilities = require('lsp.handlers').capabilities,
    }
    if server.name == 'jsonls' then
        local json_opts = require('lsp.settings.jsonls')
        opts = vim.tbl_deep_extend('force', json_opts, opts)
    end

    if server.name == 'sumneko_lua' then
        local sumneko_opts = require('lsp.settings.sumneko_lua')
        opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
    end

    server:setup(coq.lsp_ensure_capabilities(opts))
end)
