local ok, lastplace = pcall(require, "nvim-lastplace")
if not ok then
  return
end

lastplace.setup({
  lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
  lastplace_ignore_filetype = {
    "gitcommit",
    "gitrebase",
    "svn",
    "hgcommit",
    "harpoon"
  },
  lastplace_open_folds = true
})
