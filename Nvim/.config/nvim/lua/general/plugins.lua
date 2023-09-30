--  ╭─────────────────────╮
--  │ Auto Install Packer │
--  ╰─────────────────────╯
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    --  ╭───────────────────────╮
    --  │ Packer manages Packer │
    --  ╰───────────────────────╯
    use {'wbthomason/packer.nvim'}

    --  ╭─────────────────────╮
    --  │   Completion Engine │
    --  ╰─────────────────────╯
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-nvim-lsp-signature-help"},
            {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-nvim-lua"}, {"lukas-reineke/cmp-under-comparator"},
            {"ray-x/cmp-treesitter"}, {"lukas-reineke/cmp-rg"},
            {"l3mon4d3/LuaSnip"}, {"rafamadriz/friendly-snippets"},
            {"saadparwaiz1/cmp_luasnip"}, {"hrsh7th/cmp-emoji"},
            {"kdheepak/cmp-latex-symbols"}, {"onsails/lspkind.nvim"}
        }
    }

    --  ╭─────────╮
    --  │ Editing │
    --  ╰─────────╯
    use {"ziontee113/color-picker.nvim"}
    use {"jghauser/mkdir.nvim"}
    use {"rktjmp/paperplanes.nvim"}
    use {"saifulapm/chartoggle.nvim"}
    use {
        "m-demare/attempt.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope.nvim"}
        },
        config = function() require("attempt").setup() end
    }
    use {"nguyenvukhang/nvim-toggler"}
    use {"chrisgrieser/nvim-recorder"}
    use {"ThePrimeagen/harpoon", requires = {{"nvim-lua/plenary.nvim"}}}
    use {
        "rmagatti/auto-session",
        config = function() require("auto-session").setup() end
    }
    use {
        "echasnovski/mini.align",
        config = function() require("mini.align").setup() end 
    }
    use {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end
    }
    use {"willothy/moveline.nvim", run = 'make'}
    use {"ethanholz/nvim-lastplace"}
    use {"akinsho/toggleterm.nvim"}
    use {"CRAG666/code_runner.nvim", requires = {{"nvim-lua/plenary.nvim"}}}
    use {"elkowar/yuck.vim", requires = {{"gpanders/nvim-parinfer"}}}
    use {"habamax/vim-godot"}
    use {"tpope/vim-sleuth"}
    use {"machakann/vim-sandwich"}
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }, {"chip/telescope-software-licenses.nvim"}
        }
    }
    use {
        "smjonas/inc-rename.nvim",
        config = function() require("inc_rename").setup() end
    }
    use {
        "ojroques/nvim-lspfuzzy",
        requires = {{"junegunn/fzf"}, {"junegunn/fzf.vim"}},
        config = function() require("lspfuzzy").setup() end
    }
    use {"folke/trouble.nvim"}
    use {
        "simrat39/symbols-outline.nvim",
        config = function() require("symbols-outline").setup() end
    }
    use {"ThePrimeagen/git-worktree.nvim"}
    use {"moll/vim-bbye"}
    use {"mbbill/undotree"}

    --  ╭─────╮
    --  │ LSP │
    --  ╰─────╯
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            {"mfussenegger/nvim-dap"}, {"Weissle/persistent-breakpoints.nvim"},
            {"ofirgall/goto-breakpoints.nvim"}
        },
        config = function()
            require("dapui").setup()
            require("persistent-breakpoints").setup()
        end
    }
    use {"j-hui/fidget.nvim"}
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
    }
    use {"weilbith/nvim-code-action-menu"}
    use {
        "rmagatti/goto-preview",
        requires = {{"neovim/nvim-lspconfig"}},
        config = function() require("goto-preview").setup() end
    }
    use {
        "junnplus/lsp-setup.nvim",
        requires = {
            {"neovim/nvim-lspconfig"}, {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"}
        }
    }
    use {
        "Vidocqh/lsp-lens.nvim",
        config = function() require("lsp-lens").setup() end
    }

    --  ╭──────────────╮
    --  │   Treesitter │
    --  ╰──────────────╯
    use {"wansmer/treesj", requires = {{"nvim-treesitter/nvim-treesitter"}}}
    use {
        "HiPhish/nvim-ts-rainbow2",
        requires = {{"nvim-treesitter/nvim-treesitter"}}
    }
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = {{"nvim-treesitter/nvim-treesitter"}}
    }
    use {"windwp/nvim-ts-autotag"}
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup() end
    }
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end
    }
    use {"AckslD/swenv.nvim", config = function() require("swenv").setup() end}
    use {
        "simrat39/rust-tools.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"}, {"mfussenegger/nvim-dap"},
            {"neovim/nvim-lspconfig"}
        }
    }
    use {"romainl/vim-cool"}
    use {
        "RRethy/nvim-treesitter-textsubjects",
        requires = {{"nvim-treesitter/nvim-treesitter"}}
    }
    use {"nvim-treesitter/nvim-treesitter"}

    --  ╭──────────╮
    --  │   Visual │
    --  ╰──────────╯
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            {"nvim-tree/nvim-web-devicons"}
        }
    }
    use {
        "stevearc/dressing.nvim",
        requires = {
            {"nvim-telescope/telescope.nvim"}, {"ziontee113/icon-picker.nvim"}
        }
    }
    use {"lukas-reineke/indent-blankline.nvim"}
    use {
        "folke/todo-comments.nvim",
        requires = {{"nvim-lua/plenary.nvim"}},
        config = function() require("todo-comments").setup() end
    }
    use {"LudoPinelli/comment-box.nvim"}
    use({
        "utilyre/sentiment.nvim",
        tag = "*",
        config = function() require("sentiment").setup() end
    })
    use {"RRethy/vim-illuminate"}
    use {
        "mawkler/modicator.nvim",
        config = function() require("modicator").setup() end
    }
    use {"NvChad/nvim-colorizer.lua"}
    use {"lewis6991/gitsigns.nvim"}
    use {"rcarriga/nvim-notify"}
    use {
        "tiagovla/tokyodark.nvim"
    }
    use {
        "akinsho/bufferline.nvim",
        requires = {{"nvim-tree/nvim-web-devicons"}}
    }
    use {
        "utilyre/barbecue.nvim",
        requires = {{"SmiteshP/nvim-navic"}, {"nvim-tree/nvim-web-devicons"}}
    }
    use {
        "m-demare/hlargs.nvim",
        requires = {{"nvim-treesitter/nvim-treesitter"}}
    }
    --  ╭─────────────────────────────────╮
    --  │ Part of the packer bootstrapper │
    --  ╰─────────────────────────────────╯
    if packer_bootstrap then require('packer').sync() end
end)
