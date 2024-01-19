local ok, gitworktree = pcall(require, 'git-worktree')
if not ok then
  return
end

gitworktree.setup({
  change_directory_command = "cd",
  update_on_change = true,
  update_on_change_command = "e .",
  clearjumps_on_change = true,
  autopush = false,
})
