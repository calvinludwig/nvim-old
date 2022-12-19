vim.g.background = "dark"

local present, catppuccin = pcall(require, "catppuccin")
if not present then return end

catppuccin.setup {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {
		macchiato = {},
	},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		notify = false,
		mini = false,
		bufferline = true,
		harpoon = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
}

vim.cmd.colorscheme "catppuccin"
