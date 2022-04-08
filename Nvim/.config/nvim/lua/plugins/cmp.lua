local ok_cmp, cmp = pcall(require, "cmp")
local ok_snip, snip = pcall(require, "luasnip")
local ok_npm, npm = pcall(require, "cmp-npm")
local ok_sort, underSort = pcall(require, "cmp-under-comparator")
if not ok_cmp or not ok_snip or not ok_npm or not ok_sort then
    return

end

npm.setup({})
require("luasnip/loaders/from_vscode").lazy_load() --Load vs_code style snippets eg friendly snippets

local backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Symboles from lunarvims config
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

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

        ["<CR>"] = cmp.mapping.confirm { select = true },
        -- Lunarvims "supertab"
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snip.expandable() then
                snip.expand()
            elseif snip.expand_or_jumpable() then
                snip.expand_or_jump()
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
        elseif snip.jumpable(-1) then
            snip.jump(-1)
        else
            fallback()
        end
    end, {
    "i",
    "s",
}),
  },
  formatting = {
      fields = { "abbr", "kind"},
      format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          return vim_item
      end,
  },
  sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      -- Specific Scenarios:
      {name = "npm", keyword_length = 4},
      {name = "tmux"},
      {name = "nvim_lua"}
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
  documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  experimental = {
      ghost_text = false,
      native_menu = false,
  },
}
