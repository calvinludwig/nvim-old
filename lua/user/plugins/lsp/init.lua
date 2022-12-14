local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.ensure_installed({
	"sumneko_lua",
	"gopls",
})

lsp.nvim_workspace()

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = "💀",
		warn = "⚠️",
		hint = "👀",
		info = "ℹ️",
	},
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

local a = "user.plugins.lsp."

require(a .. "null-ls")
