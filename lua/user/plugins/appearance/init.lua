local a = "user.plugins.appearance."

require(a .. "colorscheme")
require(a .. "lines")
require(a .. "zenmode")

vim.notify = require("notify")
