return {
  {"weilbith/nvim-code-action-menu"},
  {
    "rmagatti/goto-preview",
    dependencies = "neovim/nvim-lspconfig",
    config = true
  },
  {
    "Vidocqh/lsp-lens.nvim",
    config = true
  },
  {
    "ojroques/nvim-lspfuzzy",
    dependencies = {"junegunn/fzf", "junegunn/fzf.vim"},
    main = "lspfuzzy",
    config = true
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local lspconfig = require("lspconfig")
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "asm_ls", "bashls", "clangd", "csharp_ls", "cmake", "cssls",
                "dockerls", "eslint", "emmet_language_server", "gopls", "html",
                "jsonls", "java_language_server", "tsserver", "ltex", "lua_ls",
                "marsksman", "ocamllsp", "prismals", "pyright", "rust_analyzer",
                "sqlls", "svelte", "tailwindcss", "yamlls", "zls"
            },
        })

        local signs = {
          { name = "DiagnosticSignError", text = "" },
          { name = "DiagnosticSignWarn",  text = "" },
          { name = "DiagnosticSignHint",  text = "" },
          { name = "DiagnosticSignInfo",  text = "" }
        }

        for _, sign in ipairs(signs) do
          vim.fn.sign_define(sign.name,
            { texthl = sign.name, text = sign.text, numhl = "" })
        end

        vim.diagnostic.config({
            signs = { active = signs },
            underline = true,
            virtual_text = true,
            update_in_insert = true,
            severity_sort = true,
        })


        lspconfig.lua_ls.setup({
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
        })
        --require("lsp-setup")
    end,
  },
}
