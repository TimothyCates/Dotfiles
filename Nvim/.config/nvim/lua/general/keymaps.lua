--  ╭──────────────────────────────────────────────────────────╮
--  │                       Basic Setup                        │
--  ╰──────────────────────────────────────────────────────────╯
--  ╭──────────────────────╮
--  │ Increase readability │
--  ╰──────────────────────╯
local keymap = vim.keymap.set
local opts = { silent = true }

--  ╭──────────────────╮
--  │ Leader key setup │
--  ╰──────────────────╯
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--  ╭──────────────────────────────────────────────────────────╮
--  │                    Core nvim keybinds                    │
--  ╰──────────────────────────────────────────────────────────╯
--  ╭──────────────────────────────────────────────────╮
--  │  Normal Mode                                     │
--  ╰──────────────────────────────────────────────────╯
--  ╭───────────────────────────╮
--  │ Alt + movement for resize │
--  ╰───────────────────────────╯
keymap('n', '<M-j>', ':resize -2<cr>', opts)
keymap('n', '<M-k>', ':resize +2<cr>', opts)
keymap('n', '<M-h>', ':vertical resize -2<cr>', opts)
keymap('n', '<M-l>', ':vertical resize +2<cr>', opts)

--  ╭─────────────────────────────────────╮
--  │ Ctrl + movement for window movement │
--  ╰─────────────────────────────────────╯
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

--  ╭──────────────────────────────────────╮
--  │ Shift + movement for buffer movement │
--  ╰──────────────────────────────────────╯
keymap('n', '<S-h>', ':BufferLineCyclePrev<cr>', opts)
keymap('n', '<S-l>', ':BufferLineCycleNext<cr>', opts)
keymap('n', '<S-x>', ':Bdelete<cr>', opts)

--  ╭──────────────────╮
--  │ Ctrl + S to save │
--  ╰──────────────────╯
keymap('n', '<C-s>', ':w<CR>', opts)

--  ╭───────────────────────────────────╮
--  │ Center on any movement,           │
--  │ Keeps cursor in center of screen  │
--  ╰───────────────────────────────────╯
keymap('n', 'j', 'jzz', opts)
keymap('n', 'k', 'kzz', opts)

--  ╭─────────────────────╮
--  │ Center when jumping │
--  ╰─────────────────────╯
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '<C-o>', '<C-o>zz', opts)
keymap('n', '<C-i>', '<C-i>zz', opts)

--  ╭─────╮
--  │ Lsp │
--  ╰─────╯
keymap('n', 'gD', vim.lsp.buf.declaration, opts)
keymap('n', 'gd', vim.lsp.buf.definition, opts)
keymap('n', 'gi', vim.lsp.buf.implementation, opts)
keymap('n', 'gr', vim.lsp.buf.references, opts)
keymap('n', 'K', vim.lsp.buf.hover, opts)
keymap('n', '<leader>rn', ':IncRename ', opts)
keymap('n', '<leader>d', vim.lsp.buf.type_definition, opts)
keymap({ 'n', 'v' }, '<leader>ca', ':CodeActionMenu<cr>', opts)


--  ╭──────────────────────────────────────────────────╮
--  │  Visual Mode                                     │
--  ╰──────────────────────────────────────────────────╯
--  ╭────────────────────╮
--  │ Search and replace │
--  ╰────────────────────╯
keymap({ 'n', 'v' }, '<leader>sw', ':s///g<left><left>')
keymap('v', '<leader>f', '\"fy/\\V\\<<C-R>f\\><CR>')

--  ╭────────────────────────────╮
--  │ Indent keeps text selected │
--  ╰────────────────────────────╯
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

--  ╭─────────────────────────╮
--  │ Tab also does indenting │
--  ╰─────────────────────────╯
keymap('v', '<TAB>', '>gv', opts)
keymap('v', '<S-TAB>', '<gv', opts)

--  ╭────────────────────────────────────╮
--  │ Pasting doesnt overwrite clipboard │
--  ╰────────────────────────────────────╯
keymap('v', 'p', '"_dP', opts)

--  ╭────────────────────────────────────────────╮
--  │ Shift + movement to shift selection around │
--  ╰────────────────────────────────────────────╯
local moveline = require('moveline')
keymap('x', 'J', moveline.block_down)
keymap('x', 'K', moveline.block_up)

--  ╭──────────────────────────────────────────────────────────╮
--  │                         Plugins                          │
--  ╰──────────────────────────────────────────────────────────╯
--  ╭──────────────────╮
--  │  Toggle NvimTree │
--  ╰──────────────────╯
keymap('n', '<Leader><Leader>', ':NvimTreeToggle<cr>', opts)

--  ╭─────────────╮
--  │ Toggle Term │
--  ╰─────────────╯
local ok, toggleterm = pcall(require, 'toggleterm.terminal')
if ok then
  local lazygit = require('toggleterm.terminal').Terminal:new({ direction = 'float', cmd = 'lazygit', hidden = true })

  function _lazygit_toggle()
    lazygit:toggle()
  end
end
keymap('n', '<Leader>g', ':lua _lazygit_toggle()<cr>', opts)

--  ╭───────────╮
--  │ Telescope │
--  ╰───────────╯
keymap('n', '<Leader>s', ':Telescope live_grep<cr>', opts)
keymap('n', '<Leader>ff', ':Telescope find_files<cr>', opts)
keymap('n', '<Leader>ct', require("telescope").extensions.git_worktree.create_git_worktree) --Make new tree
keymap('n', '<Leader>st', require("telescope").extensions.git_worktree.git_worktrees)       --switch/delete/view trees
keymap('n', '<Leader>lsb', ':Telescope attempt<cr>', opts)

--  ╭──────────────╮
--  │ goto-preview │
--  ╰──────────────╯
keymap('n', 'gpd', require('goto-preview').goto_preview_definition, opts)
keymap('n', 'gpt', require('goto-preview').goto_preview_type_definition, opts)
keymap('n', 'gpi', require('goto-preview').goto_preview_implementation, opts)
keymap('n', 'gP', require('goto-preview').close_all_win, opts)
keymap('n', 'gpr', require('goto-preview').goto_preview_references, opts)

--  ╭──────────────╮
--  │ Color Picker │
--  ╰──────────────╯
keymap('n', '<leader>cc', ':PickColor<cr>', opts)

--  ╭──────────────╮
--  │ Nvim toggler │
--  ╰──────────────╯
keymap({ 'n', 'v' }, '<leader>tw', require('nvim-toggler').toggle)

--  ╭──────────────────╮
--  │ pastebin service │
--  ╰──────────────────╯
keymap({ 'n', 'v' }, '<leader>pc', ':PP<cr>', opts)

--  ╭─────────────────╮
--  │ Scratch buffers │
--  ╰─────────────────╯
keymap('n', '<leader>nsb', require("attempt").new_select)
keymap('n', '<leader>dsb', ':w<cr>:lua require("attempt").delete_buf()<cr>', opts)

--  ╭──────────────────╮
--  │ Nice screenshots │
--  ╰──────────────────╯
keymap('v', '<F5>', ':CarbonNowSh<cr>', opts)

--  ╭───────────╮
--  │ --Harpoon │
--  ╰───────────╯
keymap('n', '<leader>hm', require("harpoon.mark").add_file)
keymap('n', '<leader>hl', require("harpoon.ui").toggle_quick_menu)
keymap('n', '<C-n>', require("harpoon.ui").nav_next)
keymap('n', '<C-m>', require("harpoon.ui").nav_prev)

--  ╭─────────────╮
--  │ Code Runner │
--  ╰─────────────╯
keymap('n', '<leader>r', ':RunCode<cr>', opts)
keymap('n', '<leader>rf', ':RunFile<cr>', opts)
keymap('n', '<leader>rp', ':RunProject<cr>', opts)
keymap('n', '<leader>rc', ':RunClose<cr>', opts)

--  ╭─────────╮
--  │ Trouble │
--  ╰─────────╯
keymap('n', '<leader>t', ':Trouble<cr>', opts)

--  ╭────────────────╮
--  │ Symbol Outline │
--  ╰────────────────╯
keymap('n', '<leader>so', ':SymbolsOutline<cr>', opts)

--  ╭─────────╮
--  │ --swenv │
--  ╰─────────╯
keymap('n', '<leader>se', require("swenv.api").pick_venv)

--  ╭────────╮
--  │ TreeSJ │
--  ╰────────╯
keymap('n', '<leader>as', require("treesj").split)
keymap('n', '<leader>aj', require("treesj").join)


--  ╭──────────────────────────────────────────────────────────╮
--  │                      Auto Commands                       │
--  ╰──────────────────────────────────────────────────────────╯
--  ╭────────────────╮
--  │ Colorizer Hack │
--  ╰────────────────╯
vim.cmd('autocmd! TextChanged * silent! ColorizerAttachToBuffer')
vim.cmd('autocmd! InsertLeave * silent! ColorizerAttachToBuffer')

--  ╭────────────────────────────────────╮
--  │ Center first result when searching │
--  ╰────────────────────────────────────╯
vim.api.nvim_exec([[cnoremap <silent><expr> <enter> index(['/', '?'], getcmdtype()) >= 0 ? '<enter>zz' : '<enter>']],
  false)

--  ╭────────────────────────────────────────────╮
--  │ Lsp Diagnostic hover when cursor over line │
--  ╰────────────────────────────────────────────╯
vim.api.nvim_create_augroup("lsp_diagnostic_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua vim.diagnostic.open_float()",
  group = "lsp_diagnostic_hold"
})
