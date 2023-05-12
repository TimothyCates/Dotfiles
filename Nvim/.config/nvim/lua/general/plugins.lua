-- Autoload dep
local path = vim.fn.stdpath("data") .. "/site/pack/deps/opt/dep"

if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path })
end

vim.cmd("packadd dep")

require "dep" {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "lukas-reineke/cmp-under-comparator",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
      "l3mon4d3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-emoji",
      "kdheepak/cmp-latex-symbols",
      "onsails/lspkind.nvim",
    }
  },
  -- Editing
  {
    "ziontee113/color-picker.nvim"
  },
  {
    "jghauser/mkdir.nvim"
  },
  {
    "rktjmp/paperplanes.nvim"
  },
  {
    "saifulapm/chartoggle.nvim",
    requires = {
      "tiagovla/tokyodark.nvim"
    },
  },
  {
    "m-demare/attempt.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    function()
      require('attempt').setup();
    end,
  },
  {
    "nguyenvukhang/nvim-toggler"
  },
  {
    "chrisgrieser/nvim-recorder"
  },
  {
    "ThePrimeagen/harpoon",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "rmagatti/auto-session",
    requires = {
      "nvim-tree/nvim-tree.lua",
    },
    function()
      require("auto-session").setup({
        log_level = "error",
        pre_save_cmds = { function() require("nvim-tree.api").tree.close() end },
        post_save_cmds = { function() require("nvim-tree.api").tree.toggle({ focus = false }) end },
        post_open_cmds = { function() require("nvim-tree.api").tree.toggle({ focus = false }) end },
        post_restore_cmds = { function() require("nvim-tree.api").tree.toggle({ focus = false }) end },
      })
    end
  },
  {
    "echasnovski/mini.align",
    function()
      require("mini.align").setup()
    end
  },
  {
    "numToStr/Comment.nvim",
    function()
      require("Comment").setup()
    end
  },
  {
    "willothy/moveline.nvim",
    config = function()
      os.execute("make")
    end
  },
  {
    "ethanholz/nvim-lastplace"
  },
  {
    "akinsho/toggleterm.nvim",
    requires = {
      "tiagovla/tokyodark.nvim"
    },
  },
  {
    "CRAG666/code_runner.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "elkowar/yuck.vim",
    requires = {
      "gpanders/nvim-parinfer"
    }
  },
  {
    "tpope/vim-sleuth"
  },
  {
    "machakann/vim-sandwich"
  },
  {
    "nvim-telescope/telescope.nvim",
    deps = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "chip/telescope-software-licenses.nvim"
    }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      os.execute(
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build")
    end
  },
  {
    "smjonas/inc-rename.nvim",
    function()
      require("inc_rename").setup()
    end
  },
  {
    "ojroques/nvim-lspfuzzy",
    requires = {
      "junegunn/fzf",
      "junegunn/fzf.vim"
    },
    function()
      require("lspfuzzy").setup()
    end
  },
  {
    "folke/trouble.nvim"
  },
  {
    "simrat39/symbols-outline.nvim",
    function()
      require("symbols-outline").setup()
    end
  },
  {
    "ThePrimeagen/git-worktree.nvim"
  },
  {
    "moll/vim-bbye"
  },
  {
    "mbbill/undotree"
  },

  -- LSP
  {
    "mfussenegger/nvim-dap",
    deps = {
      "rcarriga/nvim-dap-ui",
      "Weissle/persistent-breakpoints.nvim",
      "ofirgall/goto-breakpoints.nvim"
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = {
      "Weissle/persistent-breakpoints.nvim",
      "ofirgall/goto-breakpoints.nvim"
    },
    function()
      require("dapui").setup()
      require('persistent-breakpoints').setup()
    end
  },
  {
    "j-hui/fidget.nvim",
    function()
      require("fidget").setup({
        window = {
          relative = "editor",
          blend = 0
        }
      })
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  },
  {
    "weilbith/nvim-code-action-menu"
  },
  {
    "neovim/nvim-lspconfig",
    deps = {
      "rmagatti/goto-preview",
    }
  },
  {
    "rmagatti/goto-preview",
    function()
      require("goto-preview").setup()
    end
  },
  {
    "junnplus/lsp-setup.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    }
  },
  {
    "VidocqH/lsp-lens.nvim",
    function()
      require("lsp-lens").setup()
    end
  },

  -- Tree-sitter
  {
    "theRealCarneiro/hyprland-vim-syntax",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "Wansmer/treesj",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    },
    function()
      require("treesj").setup({
        use_default_keymaps = false,
        check_syntax_errors = false,
        max_join_length = 1000
      })
    end
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "windwp/nvim-ts-autotag"
  },
  {
    "windwp/nvim-autopairs",
    function()
      require("nvim-autopairs").setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end
  },
  {
    "AckslD/swenv.nvim",
    function()
      require("swenv").setup()
    end
  },
  {
    "simrat39/rust-tools.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig"
    }
  },
  {
    "romainl/vim-cool"
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  { "nvim-treesitter/nvim-treesitter",
    function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "javascript", "rust", "comment", "cpp", "css", "dot", "gitignore", "go", "java",
          "json", "typescript", "yuck" },
        auto_install = true
      })
    end
  },

  -- Visual
  {
    "kristijanhusak/vim-carbon-now-sh",
    function()
      vim.g.carbon_now_sh_options = {
        bg = "rgba%28171%2C184%2C195%2C0%29&t=theme%253Aaykdntjt4md",
        wt = "boxy",
        ln = "false",
        ds = "true",
        dsyoff = "20px",
        dsblur = "68px",
        wc = "true",
        wa = "true",
        pv = "56px",
        ph = "56px",
        fl = "1",
        fm = "JetBrains+Mono",
        fs = "14px",
        lh = "200%25",
        si = "false",
        es = "2x",
        wm = "false",
      }
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "stevearc/dressing.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "ziontee113/icon-picker.nvim"
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim"
  },
  {
    "folke/todo-comments.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    function()
      require("todo-comments").setup()
    end
  },
  {
    "LudoPinelli/comment-box.nvim"
  },
  {
    "utilyre/sentiment.nvim",
    function()
      require("sentiment").setup()
    end,
  },
  {
    "RRethy/vim-illuminate"
  },
  {
    "mawkler/modicator.nvim",
    requires = {
      "tiagovla/tokyodark.nvim"
    },
    function()
      require("modicator").setup()
    end
  },
  {
    "NvChad/nvim-colorizer.lua"
  },
  {
    "lewis6991/gitsigns.nvim"
  },
  {
    "rcarriga/nvim-notify",
    requires = {
      "tiagovla/tokyodark.nvim"
    }
  },
  {
    "tiagovla/tokyodark.nvim",
    function()
      vim.g.tokyodark_transparent_background = true
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = true
      vim.g.tokyodark_color_gamma = "1.0"
      vim.cmd("colorscheme tokyodark")
    end
  },
  {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify"
    },
    function()
      require("noice").setup()
    end
  },
  {
    "akinsho/bufferline.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "utilyre/barbecue.nvim",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    "m-demare/hlargs.nvim",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
}
