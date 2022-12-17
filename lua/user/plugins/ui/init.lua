local path = 'user.plugins.ui.'

require(path .. 'colorscheme')
require(path .. 'feline')
require(path .. 'zenmode')

vim.notify = require 'notify'
