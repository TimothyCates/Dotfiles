local keymap = vim.keymap.set
local opts = { silent = true }

-- Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--  ╭──────────────────────────────────────────────────╮
--  │  Normal Mode                                     │
--  ╰──────────────────────────────────────────────────╯
-- Alt + movement for resize
keymap('n', '<M-j>', ':resize -2<cr>', opts)
keymap('n', '<M-k>', ':resize +2<cr>', opts)
keymap('n', '<M-l>', ':vertical resize -2<cr>', opts)
keymap('n', '<M-h>', ':vertical resize +2<cr>', opts)

--  Ctrl + movement for window movement
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Shift + movement for buffer movement
keymap('n', '<S-h>', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<S-x>', ':Bdelete<cr>', opts)

-- Ctrl + S to save
keymap('n', '<C-s>', ':w<CR>', opts)

-- Center on any movement
keymap('n', 'j', 'jzz', opts)
keymap('n', 'k', 'kzz', opts)

-- Center when jumping 
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)

--  ╭──────────────────────────────────────────────────╮
--  │  Visual Mode                                     │
--  ╰──────────────────────────────────────────────────╯

-- Indent keeps text selected
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- Tab also does indenting
keymap('v', '<TAB>', '>gv', opts)
keymap('v', '<S-TAB>', '<gv', opts)

-- Pasting doesnt overwrite clipboard
keymap('v', 'p', '"_dP', opts)

--  ╭──────────────────────────────────────────────────────────╮
--  │                         Plugins                          │
--  ╰──────────────────────────────────────────────────────────╯
-- Open File Browser
keymap('n', '<Leader><Leader>', ':NvimTreeToggle<cr>', opts)

