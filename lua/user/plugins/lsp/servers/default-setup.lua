M = {}

M.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.on_attach = function(_, bufnr)
	local saga = require 'lspsaga'
	saga.init_lsp_saga {
		code_action_icon = '',
	}

	local telescope = require 'telescope.builtin'
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
	vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
	vim.keymap.set('n', '<leader>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)

	vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
	vim.keymap.set('n', 'gt', telescope.lsp_type_definitions, opts)
	vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', opts)
	vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
	vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)
	vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
	vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

	local Format = function(_)
		if vim.lsp.buf.format then
			vim.lsp.buf.format()
		elseif vim.lsp.buf.formatting then
			vim.lsp.buf.formatting()
		end
	end

	vim.keymap.set('n', '<leader>F', Format, opts)
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', Format, { desc = 'Format current buffer with LSP' })
end

return M
