local path = 'user.plugins.lsp.servers'
local default_setup = require(path .. '.default-setup')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('mason-lspconfig').setup {
	ensure_installed = { 'sumneko_lua' },
}

require('lspconfig').sumneko_lua.setup {
	on_attach = default_setup.on_attach,
	capabilities = default_setup.capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = { library = vim.api.nvim_get_runtime_file('', true) },
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
}
