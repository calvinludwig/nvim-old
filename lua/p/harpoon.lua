local harpoon_exists, _ = pcall(require, 'harpoon')
if not harpoon_exists then
	vim.notify('plugin harpoon not installed', 'error')
	return
end

local ui = require 'harpoon.ui'
local mark = require 'harpoon.mark'

vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Add file to Harpoon' })
vim.keymap.set('n', '<C-e>', ':Telescope harpoon marks<CR>', { desc = 'Open Harpoon menu' })

for i = 1, 9, 1 do
	vim.keymap.set('n', '<leader>' .. i, function() ui.nav_file(i) end)
end
