vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
    },
}

