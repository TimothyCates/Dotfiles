local options = vim.opt
local eval = vim.cmd

-- Backup/Undo Settings
options.backup = false
options.undofile = true
options.swapfile = false
options.writebackup = false
options.hidden = true

-- Search/Command Settings
options.ignorecase = true
options.hlsearch = false
options.cmdheight = 2

-- User Experience settings
options.cursorline = false
options.syntax = 'ON'
options.wrap = true
options.breakindent = true
options.linebreak = true
options.breakat = ' ^I!@*+;:,./?'
options.showbreak = '   '
options.splitbelow = true
options.splitright = true
options.smarttab = true
options.autoindent = true
options.showmode = false
options.clipboard = 'unnamedplus'
options.termguicolors = true
options.expandtab = true
options.shiftwidth = 2
options.tabstop = 2
options.softtabstop = 2
options.number = true
options.scrolloff = 8
options.updatetime = 300
options.timeoutlen = 300
options.conceallevel = 0
options.synmaxcol = 500
options.signcolumn = "yes"
eval [[set iskeyword+=-]]

-- Encoding
options.encoding = 'utf-8'
options.fileencoding = 'utf-8'
eval [[set formatoptions-=c]]
eval [[set formatoptions-=r]]
eval [[set formatoptions-=o]]

-- Alacritty cursor compatibility
eval
[[
    augroup change_cursor
        au!
        au ExitPre * :set guicursor=a:hor90
    augroup END
]]


eval [[
    if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
]]
