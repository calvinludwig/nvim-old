local telescope = require 'telescope'
local builtin = require 'telescope.builtin'
local actions= require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup {
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown {
				-- even more opts
			},
		},
	},
	defaults = {
		mappings = {
			i = { ['<c-t>'] = trouble.open_with_trouble },
			n = { ['<c-t>'] = trouble.open_with_trouble },
		},
	},
}

telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
telescope.load_extension 'ui-select'

-- See `:help telescope.builtin`

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set(
	'n',
	'<leader>fb',
	require('telescope').extensions.file_browser.file_browser,
	{ desc = '[S]earch [F]iles' }
)
vim.keymap.set('n', '<c-p>', builtin.git_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer]' })
