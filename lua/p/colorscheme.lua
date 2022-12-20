vim.g.background = 'light'

local present, catppuccin = pcall(require, 'catppuccin')
if not present then return end

catppuccin.setup {
	flavour = 'latte', -- latte, frappe, macchiato, mocha
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
	dim_inactive = {
		enabled = true,
		shade = 'dark',
		percentage = .1,
	},
	color_overrides = {
		macchiato = {},
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
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },

                warnings = { "underline" },
                information = { "underline" },
            },
        },
        navic = {
            enabled = false,
            custom_bg = "NONE",
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
