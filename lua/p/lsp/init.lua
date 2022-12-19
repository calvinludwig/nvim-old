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

local common = require 'p.lsp.common'

local servers = {
	'sumneko_lua',
	'rust_analyzer',
	'intelephense',
	'sqls',
	'gopls',
	'html',
	'tsserver',
	'taplo',
	'bashls',
	'jsonls',
	'tailwindcss',
	'cssls',
	'yamlls',
	'pyright',
	'marksman',
	'clangd',
	'cmake',
}

require('mason-lspconfig').setup {
	ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = common.on_attach,
		capabilities = common.capabilities,
	}
end

for _, server in ipairs(servers) do
	pcall(require, 'p.lsp.' .. server)
end

require 'p.lsp.null-ls'
