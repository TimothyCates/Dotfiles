require 'general.options'
require 'general.colorscheme'
require 'general.plugins'
require 'plugins'
require 'lsp'
--Last to prevent plugins over-writing my keybindings
require 'general.keymaps'
