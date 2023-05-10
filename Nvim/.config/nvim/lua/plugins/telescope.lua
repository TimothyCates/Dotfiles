local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
  }
})

--Extentsions
telescope.load_extension "fzf"
telescope.load_extension "git_worktree"
--telescope.load_extension "software-licenses"
telescope.load_extension "attempt"
