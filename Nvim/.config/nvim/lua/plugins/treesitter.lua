local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

local rainbowColors = {
  "#bb9af7",
  "#ff9e64",
  "#9ece6a",
  "#f7768e",
  "#7dcfff",
  "#e0af68"
}

configs.setup {
  sync_install = false,
  ignore_install = { "" },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = { "" },
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended = true,
    colors = rainbowColors,
  },
  textsubject = {
    enable = true,
    prev_selection = ',',
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },
  context_commentstring = {
    enable = true,
  },
}

for i, c in ipairs(rainbowColors) do -- p00f/rainbow#81
  vim.cmd(("hi rainbowcol%d guifg=%s"):format(i, c))
end
