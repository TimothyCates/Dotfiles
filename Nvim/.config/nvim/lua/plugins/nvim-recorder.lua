local ok, recorder = pcall(require, "recorder")
if not ok then
  return
end

recorder.setup {
  slots = { "a", "b", "c" },
  mapping = {
    startStopRecording = "q",
    playMacro = "Q",
    switchSlot = "<C-q>",
    editMacro = "cq",
    yankMacro = "yq",
    addBreakPoint = "##",
  },

  clear = true,
  logLevel = vim.log.levels.INFO,
  lessNotifications = false,
  dapSharedKeymaps = false,
}
