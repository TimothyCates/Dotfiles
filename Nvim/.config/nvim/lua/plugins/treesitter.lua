return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed  = {
        "bash", "c", "comment", "cpp", "css", "diff", "gdscript",
        "gitignore", "go", "gomod", "gosum", "haskell", "java",
        "javascript", "json", "latex", "lua", "markdown",
        "markdown_inline", "regex", "rust", "scss", "typescript",
        "tsx", "zig"
      },
      context_commentstring = {
        enable = true
      },
      textsubjects = {
        enable = true,
        prev_selection = ',',
        keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
          ['i;'] = 'textsubjects-container-inner'
        }
      },
      autotag = {
        enable = true
      },
    },
    dependencies = {
      {"JoosepAlviste/nvim-ts-context-commentstring", lazy = false},
      {"RRethy/nvim-treesitter-textsubjects", lazy = false},
      {"windwp/nvim-ts-autotag", lazy = false},
    }
  },
}
