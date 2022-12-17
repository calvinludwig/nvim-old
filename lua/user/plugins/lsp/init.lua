vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = 'single',
})

require('mason').setup {
	ui = {
		icons = {
			package_installed = '✓',
			package_pending = '➜',
			package_uninstalled = '✗',
		},
		border = 'single',
	},
}

require 'user.plugins.lsp.servers'

require 'user.plugins.lsp.cmp'
require 'user.plugins.lsp.null-ls'
require('fidget').setup {
	align = {
		bottom = true, -- align fidgets along bottom edge of buffer
		right = true, -- align fidgets along right edge of buffer
	},
	window = {
		relative = 'win', -- where to anchor, either "win" or "editor"
		blend = 100, -- &winblend for the window
		zindex = nil, -- the zindex value for the window
		border = 'single', -- style of border for the fidget window
	},
}
