vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

require("mason").setup {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		border = "single",
	},
}

require("fidget").setup {
	align = {
		bottom = true, -- align fidgets along bottom edge of buffer
		right = true, -- align fidgets along right edge of buffer
	},
	window = {
		relative = "win", -- where to anchor, either "win" or "editor"
		blend = 100, -- &winblend for the window
		zindex = nil, -- the zindex value for the window
		border = "single", -- style of border for the fidget window
	},
}

local common = require "p.lsp.common"

local servers = {
	"sumneko_lua",
	"rust_analyzer",
	"intelephense",
	"gopls",
	"html",
	"tsserver",
	"taplo",
	"bashls",
	"jsonls",
	"tailwindcss",
	"cssls",
	"yamlls",
	"pyright",
	"marksman",
	"clangd",
	"cmake",
}

require("mason-lspconfig").setup {
	ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup {
		on_attach = common.on_attach,
		capabilities = common.capabilities,
	}
end

for _, server in ipairs(servers) do
	pcall(require, "p.lsp." .. server)
end

require "p.lsp.null-ls"
