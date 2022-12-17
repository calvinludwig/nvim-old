local path = 'user.plugins.lsp.servers'
local default_setup = require(path .. '.default-setup')

require('mason-lspconfig').setup {
	ensure_installed = { 'rust_analyzer' },
}

local rt = require 'rust-tools'
rt.setup {
	server = {
		on_attach = function(_, bufnr)
			default_setup.on_attach(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, opts)
			vim.keymap.set('n', '<leader>ca', rt.code_action_group.code_action_group, opts)
		end,
	},
}
