vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
        border = "single"
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua" },
})
local saga = require("lspsaga")
saga.init_lsp_saga()
local telescope = require("telescope.builtin")
local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
local default_on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, opts)

	vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
	vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
	vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
	vim.keymap.set("n", "gr", telescope.lsp_references, opts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
end

local default_setup = {
	on_attach = default_on_attach,
	capabilities = default_capabilities,
}

lspconfig.sumneko_lua.setup({
	on_attach = default_on_attach,
	capabilities = default_capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.intelephense.setup(default_setup)
lspconfig.gopls.setup(default_setup)
lspconfig.html.setup(default_setup)
lspconfig.tsserver.setup(default_setup)

local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			default_on_attach(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			-- Hover actions
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
			-- Code action groups
			vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, opts)
		end,
	},
})

require("user.plugins.lsp.cmp")
require("user.plugins.lsp.null-ls")
