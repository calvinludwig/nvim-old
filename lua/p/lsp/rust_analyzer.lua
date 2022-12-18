local common = require('p.lsp.common')

require('mason-lspconfig').setup {
	ensure_installed = { 'rust_analyzer' },
}

local rt = require 'rust-tools'
rt.setup {
	server = {
		on_attach = function(client, bufnr)
			common.on_attach(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, opts)
			vim.keymap.set('n', '<leader>ca', rt.code_action_group.code_action_group, opts)

            vim.notify ('🦀🦀🦀 RUST TOOLS 🦀🦀🦀', 'info', {
                render = 'minimal',
            })
		end,
	},
}
