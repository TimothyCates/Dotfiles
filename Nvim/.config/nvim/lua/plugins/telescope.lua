local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end
local fb_actions = require "telescope".extensions.file_browser.actions
telescope.setup({
  extensions = {
    file_browser = {
      initial_mode = "normal"
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  }
})

--Extentsions
telescope.load_extension "fzf"
telescope.load_extension "file_browser"
telescope.load_extension "git_worktree"
telescope.load_extension "software-licenses"
telescope.load_extension "attempt"
