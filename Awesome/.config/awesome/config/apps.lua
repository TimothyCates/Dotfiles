local _ = {
  terminal = "alacritty",
  editor = os.getenv("EDITOR") or "nvim",
}

_.editor_cmd = _.terminal .. " -e " .. _.editor

return _
