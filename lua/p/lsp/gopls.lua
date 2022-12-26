local lspconfig_exists, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_exists then
	vim.notify('plugin lspconfig not installed', 'error')
	return
end

local common = require 'p.lsp.common'

lspconfig['gopls'].setup {
	cmd = { 'gopls' },
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},

			staticcheck = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	},
}
