local options = vim.opt
local eval = vim.cmd

-- Backup / Undo Settings
options.backup = false
options.undofile = true
options.swapfile = false
options.writebackup = false
options.hidden = true

-- Search / Command Settings
options.ignorecase = true
options.hlsearch = true
options.cmdheight = 2

-- Wordwrap Settings
options.wrap = true
options.breakindent = true
options.linebreak = true
options.breakat = ' ^I!@*+;:,./?'
options.showbreak = '    '
eval [[set iskeyword+=-]]

-- Indent Settings
options.autoindent = true
options.expandtab = true
options.shiftwidth = 4
options.tabstop = 4
options.softtabstop = 4

-- Appearance Settings
options.cursorline = true
vim.cmd("set cursorlineopt=number")
options.termguicolors = true
options.number = true
options.showmode = false
options.syntax = 'ON'
options.scrolloff = 8
options.conceallevel = 3
options.concealcursor = "nvic"
options.foldcolumn = "0"
vim.opt.fillchars = {
    eob = " ",
    horiz = " ",
    horizup = "│",
    horizdown = "│",
    vert = "│",
    vertleft = "│",
    vertright = "│",
    verthoriz = "│",
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = "┃"
}

-- Splitting Settings
options.splitbelow = true
options.splitright = true

-- Endocding Settings
options.encoding = 'utf-8'
options.fileencoding = 'utf-8'
eval [[set formatoptions-=c]]
eval [[set formatoptions-=r]]
eval [[set formatoptions-=o]]

-- Misc
options.clipboard = 'unnamedplus'
options.updatetime = 300
options.timeoutlen = 300
