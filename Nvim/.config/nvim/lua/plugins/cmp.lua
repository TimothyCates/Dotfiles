local ok_cmp, cmp = pcall(require, "cmp")
local ok_snip, snip = pcall(require, "luasnip")
local ok_npm, npm = pcall(require, "cmp-npm")
local ok_sort, underSort = pcall(require, "cmp-under-comparator")
local ok_kind, lspkind = pcall(require, "lspkind")
if not ok_cmp or not ok_snip or not ok_npm or not ok_sort or not ok_kind then
    return
end

npm.setup({})
require("luasnip/loaders/from_vscode").lazy_load() --Load vs_code style snippets eg friendly snippets

local backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

snip.filetype_extend("javascript", { "javascriptreact" })

cmp.setup {
    snippet = {
        expand = function(args)
            snip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },

        ["<C-n>"] = cmp.mapping(function()
            if snip.jumpable(1) then
                snip.jump(1)
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm { select = true },
        -- Lunarvims "supertab"
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snip.expandable() then
                snip.expand()
            elseif backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 30,
            before = function(entry, vim_item)
                return vim_item
            end
        })
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        -- Specific Scenarios:
        { name = "cmdline" },
        { name = "npm", keyword_length = 4 },
        { name = "tmux" },
        { name = "nvim_lua" }
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            underSort.under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}
