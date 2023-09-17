local ok_cmp, cmp = pcall(require, "cmp")
local ok_snip, luasnip = pcall(require, "luasnip")
local ok_sort, underSort = pcall(require, "cmp-under-comparator")
local ok_kind, lspkind = pcall(require, "lspkind")

if not ok_cmp or not ok_snip or not ok_sort or not ok_kind then return end

require("luasnip.loaders.from_vscode").lazy_load() -- Friendly Snippets

-- Function land
local backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local is_whitespace = function()
    local col, line = vim.fn.col('.') - 1, vim.fn.getline('.')
    return col == 0 or line:sub(col, col):match('%s')
end

local is_comment = function()
    local ctx = require("cmp.config.context")
    return ctx.in_treesitter_capture("comment") or
               ctx.in_syntax_group("Comment")
end

-- Luasnip extensions
luasnip.filetype_extend("javascriptreact", {"html"})
luasnip.filetype_extend("javascript", {"html", "javascriptreact"})

cmp.setup {

    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},

    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },
        ["<C-n>"] = cmp.mapping(function()
            if luasnip.jumpable(1) then luasnip.jump(1) end
        end, {"i", "s"}),
        ["<CR>"] = cmp.mapping.confirm({select = false}),
        -- Lunarvims "supertab"
        ["<Tab>"] = cmp.mapping(function(fallback)
            if not (is_comment() or is_whitespace()) then
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif backspace() then
                    fallback()
                else
                    fallback()
                end
            else
                fallback()
            end
        end, {"i", "s"})
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 30,
            before = function(entry, vim_item)
                vim_item.menu = "(" .. entry.source.name .. ")"
                vim_item.dup = 0
                return vim_item
            end
        })
    },
    sources = {
        {name = "nvim_lsp"}, {name = "nvim_lsp_signature_help"},
        {name = "treesitter"}, {name = "rg"},
        {name = "buffer", option = {keyword_pattern = [[\k\+]]}},
        {name = "path"}, {name = "nvim_lua"}, {name = "luasnip"},
        {name = "emoji"}, {name = "latex_symbols", option = {strategy = 0}}
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset, cmp.config.compare.exact,
            cmp.config.compare.score, cmp.config.compare.recently_used,
            cmp.config.compare.locality, underSort.under,
            cmp.config.compare.kind, cmp.config.compare.sort_text,
            cmp.config.compare.length, cmp.config.compare.order
        }
    },
    confirm_opts = {behavior = cmp.ConfirmBehavior.Replace, select = false},
    window = {
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
        }
    },
    experimental = {ghost_text = "true", native_menu = false}
}
