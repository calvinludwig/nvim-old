local catppuccin_exists, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_exists then
	vim.notify('plugin catppuccin not installed', 'error')
	return
end

catppuccin.setup {
	flavour = 'frappe', -- latte, frappe, macchiato, mocha
	transparent_background = false,
	styles = {
		comments = { 'italic' },
		conditionals = { 'italic' },
		loops = {},
		functions = {},
		keywords = { 'italic' },
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
		macchiato = {
			rosewater = '#fecdd3',
			flamingo = '#f0abfc',
			pink = '#f9a8d4',
			mauve = '#c4b5fd',
			red = '#fca5a5',
			maroon = '#fecaca',
			peach = '#fdba74',
			yellow = '#fef08a',
			green = '#86efac',
			teal = '#5eead4',
			sky = '#67e8f9',
			sapphire = '#7dd3fc',
			blue = '#93c5fd',
			lavender = '#a5b4fc',
			text = '#ffffff',
			subtext1 = '#fafafa',
			subtext0 = '#f5f5f5',
			overlay2 = '#e5e5e5',
			overlay1 = '#d4d4d4',
			overlay0 = '#a3a3a3',
			surface2 = '#737373',
			surface1 = '#525252',
			surface0 = '#404040',
			base = '#262626',
			mantle = '#1f1f1f',
			crust = '#171717',
		},
		mocha = {
			rosewater = '#fecdd3',
			flamingo = '#f0abfc',
			pink = '#f9a8d4',
			mauve = '#c4b5fd',
			red = '#fca5a5',
			maroon = '#fecaca',
			peach = '#fdba74',
			yellow = '#fef08a',
			green = '#86efac',
			teal = '#5eead4',
			sky = '#67e8f9',
			sapphire = '#7dd3fc',
			blue = '#93c5fd',
			lavender = '#a5b4fc',
			text = '#fdfdfc',
			subtext1 = '#fafaf9',
			subtext0 = '#f5f5f4',
			overlay2 = '#e7e5e4',
			overlay1 = '#d6d3d1',
			overlay0 = '#a8a29e',
			surface2 = '#78716c',
			surface1 = '#57534e',
			surface0 = '#44403c',
			base = '#292524',
			mantle = '#1c1917',
			crust = '#0e0c0b',
		},
	},
	highlight_overrides = {
		all = function(colors)
			return {
				CursorColumn = { bg = colors.surface0 },
				CursorLine = { bg = colors.surface0 },
				TelescopePromptNormal = { bg = colors.mantle, fg = colors.peach },
				TelescopePromptBorder = { bg = colors.mantle, fg = colors.peach },
				TelescopeNormal = { bg = colors.mantle },
				TelescopeBorder = { bg = colors.mantle },
			}
		end,
	},
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
		nvimtree = true,
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

local feline_exists, feline = pcall(require, 'feline')
if not feline_exists then
	vim.notify('plugin feline not installed', 'error')
	return
end

local clrs = require('catppuccin.palettes').get_palette()
local ctp_feline = require 'catppuccin.groups.integrations.feline'
local U = require 'catppuccin.utils.colors'

ctp_feline.setup {
	assets = {
		left_separator = '',
		right_separator = '',
		bar = '',
		mode_icon = ' ',
	},
}

feline.setup {
	components = ctp_feline.get(),
}
