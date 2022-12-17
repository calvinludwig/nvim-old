local path = 'user.plugins.ui.'

require(path .. 'colorscheme')
require(path .. 'lines')
require(path .. 'zenmode')

vim.notify = require 'notify'
