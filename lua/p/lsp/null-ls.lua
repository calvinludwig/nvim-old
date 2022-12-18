local null_ls = require 'null-ls'
local mason_null_ls = require 'mason-null-ls'
local common = require 'p.lsp.common'

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

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
		diagnostics.revive,
		diagnostics.staticcheck,
		formatting.gofmt,
		formatting.goimports,
		formatting.goimports_reviser,
		formatting.golines,
		-- rust
		formatting.rustfmt,
	},
}
mason_null_ls.setup {
	ensure_installed = {
		'stylua',
		'luacheck',
	},
}
