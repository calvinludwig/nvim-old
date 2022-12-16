local bufferline = require("bufferline")

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		diagnostics = "nvim_lsp",
	},
})

local ctp_feline = require("catppuccin.groups.integrations.feline")

ctp_feline.setup({
	assets = {
		left_separator = "",
		right_separator = "",
		bar = "█",
		mode_icon = "",
		dir = "  ",
		file = "   ",
		lsp = {
			server = "  ",
			error = "  ",
			warning = "  ",
			info = "  ",
			hint = "  ",
		},
		git = {
			branch = "  ",
			added = "  ",
			changed = "  ",
			removed = "  ",
		},
	},
})

require("feline").setup({
	components = ctp_feline.get(),
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		package.loaded["feline"] = nil
		package.loaded["catppuccin.groups.integrations.feline"] = nil
		require("feline").setup({
			components = require("catppuccin.groups.integrations.feline").get(),
		})
	end,
})
