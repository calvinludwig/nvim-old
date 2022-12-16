vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kj', '<ESC>')

keymap.set('n', '<Esc>', function()
	vim.cmd.nohlsearch()
	vim.cmd.echo()
end)

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', 'x', '"_x')
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<leader>y', '"+y')
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>Y', '"+Y')

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make split windows equal width and height' }) -- make split windows equal width & height
keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close current window' }) -- close current split window

keymap.set('n', '<leader><Tab>', ':bn<CR>', { desc = 'Next buffer' }) --  go to next buffer
keymap.set('n', '<leader><s-Tab>', ':bp<CR>', { desc = 'Previous buffer' }) --  go to previous buffer
keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'Close buffer' }) --  go to previous buffer
keymap.set('n', '<leader>s', ':w<CR>', { desc = 'Save buffer' }) --  go to previous buffer
