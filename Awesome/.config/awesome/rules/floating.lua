-- Define what should always be floating
return {
  rule_any = {
    instance = {
      "pinentry"
    },
    class = {
      "Arandr",
      "Steam",
      "7zfm",
      "Pavucontrol",
      "discord",
      "Nm-connection-editor"
    },
    name = {
      "Event Tester" -- xev
    },
    role = {
      "pop-up" -- Dev tools
    }

  },
  properties = {
    floating = true
  }
}
