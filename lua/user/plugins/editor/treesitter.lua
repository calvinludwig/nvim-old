local treesitter = require("nvim-treesitter.configs")

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"lua",
		"help",
		"javascript",
		"typescript",
		"rust",
		"go",
		"php",
		"toml",
		"yaml",
		"json",
		"c",
		"html",
		"css",
	},
	-- auto install above language parsers
	auto_install = true,
	sync_install = false,
	context_commentstring = { enable = true },
})
