return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua", "lukas-reineke/cmp-under-comparator",
      "ray-x/cmp-treesitter", "lukas-reineke/cmp-rg",
      "l3mon4d3/LuaSnip", "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-emoji",
      "kdheepak/cmp-latex-symbols", "onsails/lspkind.nvim"
    }
  },
  {
    "elkowar/yuck.vim",
    enabled = false,
    dependencies = "gpanders/nvim-parinfer"
  },
  {"habamax/vim-godot"},
  {
    "simrat39/rust-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig"
    }
  },
  {
    "AckslD/swenv.nvim",
    config = true,
  },
}


