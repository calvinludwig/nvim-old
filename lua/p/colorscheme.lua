vim.g.background = 'dark'

local present, catppuccin = pcall(require, 'catppuccin')
if not present then return end

catppuccin.setup {
	flavour = 'mocha', -- latte, frappe, macchiato, mocha
	transparent_background = false,
	styles = {
		comments = { 'italic' },
		conditionals = { 'italic' },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = { 'bold' },
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
	integration = {
		dap = {
			enabled = true,
			enable_ui = true, -- enable nvim-dap-ui
		},
	},
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = { 'italic' },
			hints = { 'italic' },
			warnings = { 'italic' },
			information = { 'italic' },
		},
		underlines = {
			errors = { 'underline' },
			hints = { 'underline' },
			warnings = { 'underline' },
			information = { 'underline' },
		},
	},
}

vim.cmd.colorscheme 'catppuccin'
