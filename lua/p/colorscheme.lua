local catppuccin_exists, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_exists then
	vim.notify('plugin catppuccin not installed', 'error')
	return
end
catppuccin.setup {
	flavour = 'mocha', -- latte, frappe, macchiato, mocha
	transparent_background = true,
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
	no_italic = false,
	no_bold = false,
	color_overrides = {
		mocha = {
			text = '#f5f5f5',
			subtext1 = '#dedede',
			subtext0 = '#c7c7c7',
			overlay2 = '#b3b3b3',
			overlay1 = '#9c9c9c',
			overlay0 = '#878787',
			surface2 = '#707070',
			surface1 = '#595959',
			surface0 = '#454545',
			base = '#2e2e2e',
			mantle = '#262626',
			crust = '#1c1c1c',
		},
	},
	custom_highlights = {},
	integrations = {
		aerial = false,
		barbar = false,
		beacon = false,
		cmp = true,
		coc_nvim = false,
		dashboard = false,
		fern = false,
		fidget = false,
		gitgutter = false,
		gitsigns = true,
		harpoon = true,
		hop = false,
		illuminate = false,
		leap = false,
		lightspeed = false,
		lsp_saga = false,
		lsp_trouble = true,
		markdown = true,
		mason = true,
		mini = false,
		neogit = false,
		neotest = false,
		neotree = false,
		noice = true,
		notify = true,
		nvimtree = false,
		overseer = false,
		pounce = false,
		semantic_tokens = false,
		symbols_outline = false,
		telekasten = false,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = false,
		vim_sneak = false,
		vimwiki = false,
		which_key = false,

		-- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
		dap = {
			enabled = true,
			enable_ui = true,
		},
		indent_blankline = {
			enabled = false,
			colored_indent_levels = false,
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
		navic = {
			enabled = false,
			custom_bg = 'NONE',
		},
	},
}

vim.cmd.colorscheme 'catppuccin'
