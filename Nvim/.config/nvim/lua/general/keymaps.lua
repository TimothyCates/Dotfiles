-- Increase readability
local keymap = vim.api.nvim_set_keymap

-- Option shorthand
local opts = { noremap = true, silent = true }

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
keymap('n', '<S-x>', ':Bdelete<cr>', opts)

-- Toggle Nvim-tree
keymap('n', '<Leader><Leader>', ':NvimTreeToggle<cr>', opts)

-- Ctrl S to save file
keymap('n', '<C-s>', ':w<CR>', opts)

-- Center on movement, I hate being on the bottom of the window
keymap('n', 'j', 'jzz', opts)
keymap('n', 'k', 'kzz', opts)

-- Center when jumping to results
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)

-- -- One line to center the first result when searching for/back
vim.api.nvim_exec([[cnoremap <silent><expr> <enter> index(['/', '?'], getcmdtype()) >= 0 ? '<enter>zz' : '<enter>']], false)

-- ToggleTerm
for i = 1, 4 do
  keymap('n', '<Leader>' .. i, ':' .. i .. 'ToggleTerm<cr>', opts)
end

local ok, toggleterm = pcall(require, 'toggleterm.terminal')
if ok then
  local lazygit = require('toggleterm.terminal').Terminal:new({ direction = 'float', cmd = 'lazygit', hidden = true })

  function _lazygit_toggle()
    lazygit:toggle()
  end
end

keymap('n', '<Leader>g', ':lua _lazygit_toggle()<cr>', opts) -- float is better for git

-- ToggleTerm movement keymaps
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<C-n>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Telescope Related
keymap('n', '<Leader>s', ':Telescope live_grep<cr>', opts) -- Search project with grep
keymap('n', '<Leader>ff', ':Telescope find_files<cr>', opts) --Find Files
--Git worktree to swap trees
keymap('n', '<Leader>ct', ':lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>', opts) --Make new tree
keymap('n', '<Leader>st', ':lua require("telescope").extensions.git_worktree.git_worktrees()<cr>', opts) --switch/delete/view trees

-- Colorizer fix (its very buggy with moving text, so lets reset it when we can)
vim.cmd('autocmd! TextChanged * silent! ColorizerAttachToBuffer')
vim.cmd('autocmd! InsertLeave * silent! ColorizerAttachToBuffer')

-- INSERT---------------------------------------------------

-- VISUAL---------------------------------------------------
-- Indent keeps slections
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- Tab also indents
keymap('v', '<TAB>', '>gv', opts)
keymap('v', '<S-TAB>', '<gv', opts)

-- Pasting over selection doesnt copy selected text
keymap('v', 'p', '"_dP', opts)

-- VISUAL BLOCK---------------------------------------------
-- Move selection up and down with shift + movement
keymap("x", "J", ":move '>+1<CR>gv-gvzz", opts)
keymap("x", "K", ":move '<-2<CR>gv-gvzz", opts)
