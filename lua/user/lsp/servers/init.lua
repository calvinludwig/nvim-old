local common = require('user.lsp.servers.common')

local servers = {
    'sumneko_lua',
    'rust_analyzer',
	'intelephense',
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

require('user.lsp.servers.rust-server')
require('user.lsp.servers.lua-server')
require('user.lsp.servers.null-ls')
