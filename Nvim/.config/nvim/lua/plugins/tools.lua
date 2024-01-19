local colorscheme = require("tokyonight.colors").setup({ style = "darker" })

return {
    {
        "ThePrimeagen/git-worktree.nvim",
        opts = {
            change_directory_command = "cd",
            update_on_change = true,
            update_on_change_command = "e .",
            clearjumps_on_change = true,
            autopush = false
        }
    },
    { "moll/vim-bbye" },
    {
        "CRAG666/code_runner.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {}
    },
    {
        "ethanholz/nvim-lastplace",
        opts = {
            lastplace_ignore_buftype = {
                "quickfix",
                "nofile",
                "help"
            },
            lastplace_ignore_filetype = {
                "gitcommit",
                "gitrebase",
                "harpoon",
            },
            lastplace_open_folds = true
        }
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            save_on_toggle = false,
            save_on_change = true,
            enter_on_sendcmd = false,
            tmux_autoclose_windows = false,
            excluded_filetypes = {
                "harpoon"
            },
            mark_branch = false
        }
    },
    { "jghauser/mkdir.nvim" },
    {
        "smjonas/inc-rename.nvim",
        opts = {}
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
            }
        }
    },
    {
        "uga-rosa/ccc.nvim",
        opts = {
            alpha_show = "show",
            highlighter = {
                auto_enable = false
            }
        }
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        init = function()
            vim.api.nvim_create_augroup("ToggleTermSettings", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = "ToggleTermSettings",
                pattern = "toggleterm",
                command = "setlocal foldcolumn=0",
            })
        end,
        opts = {
            size = 10,
            open_mapping = "<C-\\>",
            shade_terminals = false,
            persist_size = true,
            direction = 'horizontal',
            highlights = {
                Normal = {
                    guibg = colorscheme.bg_dark
                }
            },
            float_opts = {
                winblend = 0,
            },
        }
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            toggler = {
                line = "gcc",
                block = "gbc"
            },
            opleader = {
                line = "gc",
                block = "gbc"
            },
            extra = {
                above = "gcO",
                below = "gco",
                eol = "gca"
            }
        },
        lazy = false
    },
    {
        "willothy/moveline.nvim",
        run = 'make',
    },
    {
        "saifulapm/chartoggle.nvim",
        opts = {
            leader = '<leader>',
            keys = { ',', ';' }
        }
    },
    {
        "chrisgrieser/nvim-recorder",
        dependencies = "chrisgrieser/nvim-notify",
        opts = {
            slots = { "a", "b", "c", "d", "e", "f" },
            mapping = {
                startStopRecording = "q",
                playMacro = "Q",
                switchSlot = "<C-q>",
                editMacro = "eq",
                yankMacro = "yq"
            },
            clear = true,
        }
    },
    {
        "echasnovski/mini.align",
        config = true
    },
    {
        "aserowy/tmux.nvim",
        enabled = false,
        opts = {
            copy_sync = {
                enable = false,
                redirect_to_clipboard = true,
            }
        }
    },
    {
        "rmagatti/auto-session",
        config = true
    },
    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup()
        end
    },
}
