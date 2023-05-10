local ok, chartoggle = pcall(require, "chartoggle")
if not ok then
  return
end

chartoggle.setup({
  leader = '<leader>',
  keys = { ',', ';' }
})
