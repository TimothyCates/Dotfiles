local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

-- Reload packer when we modify plugins.lua
vim.cmd [[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Essential
  use "wbthomason/packer.nvim" -- Have Packer Manage Itself
  use "nvim-lua/plenary.nvim" -- Dependency for Some Plugins
  use "gpanders/nvim-parinfer"
  -- Colorschemes
  use 'tiagovla/tokyodark.nvim'

  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Simple LSP Installer
  use 'jose-elias-alvarez/null-ls.nvim' -- Formatters using LSP
  use 'onsails/lspkind-nvim' -- VSCode-like Icons in lsp completion
  use "lukas-reineke/lsp-format.nvim" -- Format via lsp

  -- Completion
  use "hrsh7th/nvim-cmp" -- Completion Engine
  use "saadparwaiz1/cmp_luasnip" -- Completions From Snippets
  use "hrsh7th/cmp-buffer" -- Completions from Buffers
  use "hrsh7th/cmp-path" -- Path-based Completions
  use "david-kunz/cmp-npm" -- NPM Completions
  use "/elkowar/yuck.vim"

  -- Completion Modifier
  use "hrsh7th/cmp-nvim-lua" -- Completions for nvim lua API
  use "hrsh7th/cmp-nvim-lsp" -- Completions From Builtin LSP
  use "lukas-reineke/cmp-under-comparator" -- Sort underline competions to bottom
  use "hrsh7th/cmp-cmdline" -- Vim Cmd-line Completions

  --Snippets
  use "l3mon4d3/LuaSnip" -- Snippet Engine
  use "rafamadriz/friendly-snippets" -- Tons of snippets

  -- Visual Enchancments
  use 'folke/todo-comments.nvim' -- Color Todo Comments
  use 'kyazdani42/nvim-web-devicons' -- Web-Dev Icons
  use 'lukas-reineke/indent-blankline.nvim' -- Indent Guides
  use 'akinsho/bufferline.nvim' -- Buffer Tabline
  use 'lewis6991/gitsigns.nvim' -- Git Decorations
  use 'norcalli/nvim-colorizer.lua' -- Color Hex/Color-Code in Doc
  use 'm-demare/hlargs.nvim' -- Highlight Argument Defs, Usages
  use "p00f/nvim-ts-rainbow" -- Rainbow Brackets/Parens

  -- Feature Enchancments
  use 'moll/vim-bbye' -- Better Buffer Closing
  use 'jghauser/mkdir.nvim' -- Make Missing Dirs on Save
  use 'b3nj5m1n/kommentary' -- Smart Commenting Tool
  use 'folke/trouble.nvim' -- Window To Show All LSP Errors
  use 'aserowy/tmux.nvim' -- TMUX NVIM Navigation/Control
  use 'kyazdani42/nvim-tree.lua' -- File Browser
  use 'windwp/nvim-autopairs' -- Autopair {']" chars
  use 'tpope/vim-surround' --Surround selection/motion with x
  use 'windwp/nvim-ts-autotag' -- Auto-Close Tags
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Make Kommentary Use Correct Comment Type
  use { --popout terminal
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }
  use 'RRethy/nvim-treesitter-textsubjects' -- Select Whole Loop, Function, Ect

  -- Telescope
  use 'nvim-telescope/telescope.nvim' -- Fuzzy/File Search
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Native compiled fzf
  use "chip/telescope-software-licenses.nvim" --list of software lic's to paste
  use "ThePrimeagen/git-worktree.nvim"

  -- Syntax Highlighting (treesitter)
  use { -- Treesitter itself
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }



  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
