local ok, fidget = pcall(require, 'fidget')
if not ok then
  return
end
fidget.setup {
  window = {
    relative = "editor",
    blend = 0
  }
}
