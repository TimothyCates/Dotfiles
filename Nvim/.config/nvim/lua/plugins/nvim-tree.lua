local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end
local c = require("tokyodark.palette")

-- I change vert split shit here  because I only notice it because of nvim-tree
vim.api.nvim_set_hl(0, "NvimTreeNormal", {
  bg = c.bg0
})

vim.api.nvim_set_hl(0, "WinSeparator", {
  cterm = NONE,
  bg = NONE,
  fg = c.bg0
})

vim.opt.fillchars = {
  eob = ' ',
  horiz = ' ',
  horizup = '█',
  horizdown = '█',
  vert = '█',
  vertleft = '█',
  vertright = '█',
  verthoriz = '█'
}

nvim_tree.setup {
  root_dirs = {},
  reload_on_bufenter = true,
  select_prompts = true,
  view = {
    width = 30,
    side = "right",
    preserve_window_proportions = true,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  sync_root_with_cwd = true,
  renderer = {
    add_trailing = true,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "none",
    highlight_modified = "name",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  update_focused_file = {
    enable = true,
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = false,
    show_on_open_dirs = false,
    timeout = 400,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  experimental = {
    git = {
      async = true,
    },
  },
}

-- Refresh NvimTree after every 5 seconds to update git signs and be more responsive
vim.cmd [[call timer_start(1000 * 5, {-> execute(':NvimTreeRefresh')}, {'repeat': -1})]]
