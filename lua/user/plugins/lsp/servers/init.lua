local path = 'user.plugins.lsp.servers'

local default_setup = require(path .. '.default-setup')

local servers = { 'intelephense', 'gopls', 'html', 'tsserver' }

require('mason-lspconfig').setup {
	ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = default_setup.on_attach,
		capabilities = default_setup.capabilities,
	}
end

require(path .. '.rust-server')
require(path .. '.lua-server')
