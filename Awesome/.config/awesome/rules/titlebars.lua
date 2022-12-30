local config = require("config")
-- Controls if titlebars are enabled by default
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
