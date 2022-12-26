local telescope_exists, telescope = pcall(require, 'telescope')
if not telescope_exists then
	vim.notify('plugin telescope not installed', 'error')
	return
end
local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'

local options = {
	defaults = {
		sorting_strategy = 'ascending',
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				prompt_position = 'top',
			},
			vertical = {
				mirror = false,
			},
		},
		borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		color_devicons = true,
		file_sorter = require('telescope.sorters').get_fuzzy_file,
		generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
	},
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown {},
		},
		file_browser = {
			theme = 'ivy',
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		},
	},
}

local trouble_exists, trouble = pcall(require, 'trouble.providers.telescope')
if not trouble_exists then
	vim.notify('plugin trouble not installed', 'error')
	return
else
	options.defaults.mappings = {
		i = { ['<c-t>'] = trouble.open_with_trouble },
		n = { ['<c-t>'] = trouble.open_with_trouble },
	}
end

telescope.setup(options)

telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
telescope.load_extension 'ui-select'
telescope.load_extension 'harpoon'

-- See `:help telescope.builtin`

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set(
	'n',
	'<leader>fb',
	function() require('telescope').extensions.file_browser.file_browser { path = '%:p:h' } end,
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
