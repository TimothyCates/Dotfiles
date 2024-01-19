local colorscheme = require("tokyonight.colors").setup({ style = "darker" })

return {
    {
        "mbbill/undotree",
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nm-tree/nvim-web-devicons",
        },
        lazy = false,
        version = "*",
        main = "nvim-tree",
        init = function()
            -- Required for nvim-tree
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            vim.cmd [[
        call timer_start(1000 * 5, {-> execute(':NvimTreeRefresh')}, {'repeat': -1})
      ]]
        end,
        opts = {
            on_attach = function(bufnr)
                local api = require "nvim-tree.api"
                local function opts(desc)
                    return {
                        desc = "nvim-tree: " .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = true
                    }
                end
                api.config.mappings.default_on_attach(bufnr)
                -- custom mapping to pullup help when I need it
                vim.keymap.set(
                    'n',
                    '?',
                    api.tree.toggle_help,
                    opts('Help')
                )
            end,
            reload_on_bufenter = true,
            select_prompts = true,
            view = {
                side = "right",
                width = {
                    padding = 1
                },
                preserve_window_proportions = true,
            },
            sync_root_with_cwd = true,
            renderer = {
                add_trailing = true,
                highlight_git = true,
                highlight_modified = "name",
                indent_markers = {
                    enable = true,
                },
            },
            update_focused_file = {
                enable = true,
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
                    restrict_above_cwd = true,
                },
            },
        }
    },
    {
        "stevearc/dressing.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "ziontee113/icon-picker.nvim"
        }
    },
    {
        "mawkler/modicator.nvim",
        opts = {
            highlights = {
                defaults = {
                    bold = true,
                    italic = false
                }
            },
            integration = {
                lualine = {
                    enabled = false
                }
            }
        }
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "moll/vim-bbye",
        },
        opts = {
            highlights = {
                fill = {
                    bg = colorscheme.bg
                },
                background = {
                    bg = colorscheme.bg
                },
                tab_selected = {
                    bg = colorscheme.bg_dark
                },
                buffer_visible = {
                    bg = colorscheme.bg,
                    fg = colorscheme.fg
                },
                buffer_selected = {
                    bg = colorscheme.bg_dark
                },
                close_button_selected = {
                    bg = colorscheme.bg_dark
                },
                modified_visible = {
                    bg = colorscheme.bg
                },
                modified_selected = {
                    bg = colorscheme.bg_dark
                },
                separator_visible = {
                    bg = colorscheme.bg
                },
                separator_selected = {
                    bg = colorscheme.bg_dark
                },
                indicator_visible = {
                    bg = colorscheme.bg
                },
                offset_separator = {
                    fg = colorscheme.bg
                },
                duplicate = {
                    bg = colorscheme.bg
                },
                duplicate_selected = {
                    bg = colorscheme.bg_dark
                }
            },
            options = {
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                indicator = {
                    style = "underline"
                },
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' }
                },
                diagnostics = false,
                separator_style = { "", "" },
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                        separator = "█"
                    },
                }
            },
        }
    },
    {
        "luukvbaal/statuscol.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "mfussenegger/nvim-dap"
        },
        config = function()
            local builtin = require("statuscol.builtin")

            require("statuscol").setup({
                ft_ignore = {
                    "NvimTree",
                    "toggleterm"
                },
                segments = {
                    {
                        sign = { namespace = { "gitsign*" } },
                        click = "v:lua.ScSa"
                    },
                    {
                        sign = { name = { ".*" }, }
                    },
                    {
                        text = { builtin.lnumfunc, " " },
                        condition = { true, builtin.not_empty },
                        click = "v:lua.ScLa"
                    },
                    {
                        text = { builtin.foldfunc, "  " },
                        click = "v:lua.ScFa"
                    }
                }
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            window = {
                relative = "editor",
                blend = 0
            }
        }
    },
    {
        "rcarriga/nvim-notify",
        main = "notify",
        opts = {
            render = "minimal",
            stages = "slide",
            timeout = 2000,
            max_width = 51,
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = false,
            },
        }
    },
    {
        "folke/trouble.nvim",
        config = true,
    },
    {
        "utilyre/sentiment.nvim",
        version = "*",
        event = "VeryLazy",
        config = true,
        init = function()
            vim.g.loaded_matchparen = 1
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        "m-demare/hlargs.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = {
            color = colorscheme.purple
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    { "vim-illuminate" },
    {
        "nvimdev/hlsearch.nvim",
        event = "BufRead",
        config = true,
    },
    {
        "kevinhwang91/nvim-hlslens",
        main = "hlslens",
        init = function()
            local kopts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap('n', 'n',
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts)
            vim.api.nvim_set_keymap('n', 'N',
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts)
            vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

            vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
        end,
        config = true
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        init = function()
            local rainbow_delimiters = require("rainbow-delimiters")
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end
    },
    {
        "NvChad/nvim-colorizer.lua",
        main = "colorizer",
        opts = {
            filetype = { "*", "!md", "!txt" },
            user_default_options = {
                RRGGBBAA = true,
                css = true,
                tailwind = true,
                sass = {
                    enable = true,
                    parsers = { "css" },
                },
                virtualtext = "■",
                always_update = true
            },
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hltable = {
                "Indent_Red",
                "Indent_Yellow",
                "Indent_Blue",
                "Indent_Orange",
                "Indent_Green",
                "Indent_Purple",
                "Indent_Cyan",
            }
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                local sethl = vim.api.nvim_set_hl
                sethl(0, hltable[1], { fg = "#E06C75" })
                sethl(0, hltable[2], { fg = "#E5C07B" })
                sethl(0, hltable[3], { fg = "#61AFEF" })
                sethl(0, hltable[4], { fg = "#D19A66" })
                sethl(0, hltable[5], { fg = "#98C379" })
                sethl(0, hltable[6], { fg = "#C678DD" })
                sethl(0, hltable[7], { fg = "#56B6C2" })
            end)

            vim.g.rainbow_delimiters = { highlight = hltable }

            require("ibl").setup({
                scope = {
                    highlight = hltable
                },
                indent = {
                    highlight = hltable,
                    char = "▍"
                }
            })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "Weissle/persistent-breakpoints.nvim",
            "ofirgall/goto-breakpoints.nvim"
        },
        config = function()
            require("dapui").setup()
            require("persistent-breakpoints").setup()
        end
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        main = "ufo",
        init = function()
            local options = vim.opt
            options.foldcolumn = "1"
            options.foldlevel = 99
            options.foldlevelstart = 99
            options.foldenable = true
        end,
        opts = {
            provider_selector = function(bufnr, filetype, buftype)
                return ''
            end
        }
    },
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        lazy = false,
        opts = {
            diagnostic = {
            },
            symbol_in_winbar = {
                folder_level = 2
            },
            lightbulb = {
                enable = false
            },
            ui = {
                border = "rounded",
                code_action = "",
                title = false,
                kind = { Folder = { " " } }
            },
        },
    }
}
