-- Increase readability
local keymap = vim.api.nvim_set_keymap

-- Option shorthand
local opts = {noremap = true, silent = true}

-- Leader key setup
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- NORMAL---------------------------------------------------
-- Alt + movement for resize
keymap('n', '<M-j>', ':resize -2<cr>', opts)
keymap('n', '<M-k>', ':resize +2<cr>', opts)

keymap('n', '<M-h>', ':vertical resize -2<cr>', opts)
keymap('n', '<M-l>', ':vertical resize +2<cr>', opts)

-- Ctrl + movement for window movement
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Buffer Movement
keymap('n', '<S-h>', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<cr>', opts)

-- Toggle Nvim-tree
keymap('n', '<Leader>f', ':NvimTreeToggle<cr>', opts)

-- Ctrl S to save file
keymap('n', '<C-s>', ':w<CR>', opts)


-- INSERT---------------------------------------------------
-- Spam j and k to exit insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- VISUAL---------------------------------------------------
-- Indent keeps slections
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- Tab also indents
keymap('v', '<TAB>', '>gv', opts)

-- Pasting over selection doesnt copy selected text
keymap('v', 'p', '"_dP', opts)

-- VISUAL BLOCK---------------------------------------------
-- Move selection up and down with shift + movement
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)



