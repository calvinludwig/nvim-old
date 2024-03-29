local catppuccin_exists, catppuccin = pcall(require, 'catppuccin')
if not catppuccin_exists then
	vim.notify('plugin catppuccin not installed', 'error')
	return
end

catppuccin.setup {
	flavour = 'mocha', -- latte, frappe, macchiato, mocha
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
