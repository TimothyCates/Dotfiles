-- Mater file that loads all of our other settings files.

-- General config settings
require 'general.core'
require 'general.plugins'
require 'general.statusline'
require 'general.keymaps'

-- Loads init.lua inside respective folders
require 'plugins'
