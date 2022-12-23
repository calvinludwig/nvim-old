local lspconfig_exists, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_exists then
	vim.notify('plugin lspconfig not installed', 'error')
	return
end

local common = require 'p.lsp.common'
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
local mason_exists, mason = pcall(require, 'mason')
if not mason_exists then
	vim.notify('plugin mason not installed', 'error')
else
	mason.setup {
		ui = {
			icons = {
				package_installed = '✓',
				package_pending = '➜',
				package_uninstalled = '✗',
			},
			border = 'single',
		},
	}

	local mason_lspconfig_exists, mason_lspconfig = pcall(require, 'mason-lspconfig')
	if not mason_lspconfig_exists then
		vim.notify('plugin mason_lspconfig not installed', 'error')
	else
		mason_lspconfig.setup {
			ensure_installed = servers,
		}
	end
end

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		on_attach = common.on_attach,
		capabilities = common.capabilities,
	}
end

for _, server in ipairs(servers) do
	pcall(require, 'p.lsp.' .. server)
end

require 'p.lsp.null-ls'
