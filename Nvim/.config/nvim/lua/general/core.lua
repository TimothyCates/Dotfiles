local options = vim.opt
local eval = vim.cmd

--  ╭────────────────────────╮
--  │ Backup / Undo Settings │
--  ╰────────────────────────╯
options.backup = false
options.undofile = true
options.swapfile = false
options.writebackup = false
options.hidden = true

--  ╭───────────────────────────╮
--  │ Search / Command Settings │
--  ╰───────────────────────────╯
options.ignorecase = true
options.hlsearch = true
options.cmdheight = 2

--  ╭───────────────────╮
--  │ Wordwrap Settings │
--  ╰───────────────────╯
options.wrap = true
options.breakindent = true
options.linebreak = true
options.breakat = ' ^I!@*+;:,./?'
options.showbreak = '    '
eval [[set iskeyword+=-]]

--  ╭─────────────────╮
--  │ Indent Settings │
--  ╰─────────────────╯
options.autoindent = true
options.expandtab = true
options.shiftwidth = 2
options.tabstop = 2
options.softtabstop = 2

--  ╭─────────────────────╮
--  │ Appearance Settings │
--  ╰─────────────────────╯
options.cursorline = true
vim.cmd("set cursorlineopt=number")
options.termguicolors = true
options.number = true
options.synmaxcol = 500
options.signcolumn = "yes"
options.showmode = false
options.syntax = 'ON'
options.scrolloff = 8
options.conceallevel = 0

--  ╭────────────────────╮
--  │ Splitting Settings │
--  ╰────────────────────╯
options.splitbelow = true
options.splitright = true

--  ╭────────────────────╮
--  │ Endocding Settings │
--  ╰────────────────────╯
options.encoding = 'utf-8'
options.fileencoding = 'utf-8'
eval [[set formatoptions-=c]]
eval [[set formatoptions-=r]]
eval [[set formatoptions-=o]]

--  ╭──────╮
--  │ Misc │
--  ╰──────╯
options.clipboard = 'unnamedplus'
options.updatetime = 300
options.timeoutlen = 300
