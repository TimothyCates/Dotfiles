vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd("colorscheme tokyodark")

vim.api.nvim_set_hl(0, "SignColumn", { bg=none })
vim.api.nvim_set_hl(0, "Normal", { bg=none })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg=none })
vim.api.nvim_set_hl(0, "PMenu", { bg=none })
vim.api.nvim_set_hl(0, "PMenuSbar", { bg=none })
vim.api.nvim_set_hl(0, "NormalNC", { bg=none })
vim.api.nvim_set_hl(0, "Terminal", { bg=none })
vim.api.nvim_set_hl(0, "DiffviewEndOfBuffer", { bg=none })
vim.api.nvim_set_hl(0, "DiffviewNormal", { bg=none })
vim.api.nvim_set_hl(0, "DiffviewSignColumn", { bg=none })
