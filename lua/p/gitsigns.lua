local gitsigns_exists, gitsigns = pcall(require, 'gitsigns')
if not gitsigns_exists then
	vim.notify('plugin gitsigns not installed', 'error')
	return
end

gitsigns.setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map('n', '<leader>gg', ':Gitsigns toggle_signs<CR>')
	end,
}
