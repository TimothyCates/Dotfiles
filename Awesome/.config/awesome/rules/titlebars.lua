local config = require("config")
return {
  rule_any = {
    type = {
      "normal",
      "dialog"
    }
  },
  properties = {
    titlebars_enabled = config.titlebars_always
  }
}
