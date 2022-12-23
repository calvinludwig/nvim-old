local null_ls_exists, null_ls = pcall(require, 'null-ls')
if not null_ls_exists then
	vim.notify('plugin null_ls not installed', 'error')
	return
end
local common = require 'p.lsp.common'

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
	on_attach = common.on_attach,
	sources = {
		code_actions.refactoring,
		-- lua
		formatting.stylua,
		-- php
		diagnostics.php,
		diagnostics.phpstan,
		formatting.pint.with {
			command = 'pint',
		},
		-- go
		diagnostics.golangci_lint,
		-- diagnostics.revive,
		diagnostics.staticcheck,
		formatting.gofmt,
		formatting.goimports,
		formatting.goimports_reviser,
		formatting.golines,
		-- rust
		formatting.rustfmt,
	},
}

local mason_null_ls_exists, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_exists then
	vim.notify('plugin mason_null_ls not installed', 'error')
	return
end

mason_null_ls.setup {
	ensure_installed = {
		'stylua',
		'luacheck',
	},
}
