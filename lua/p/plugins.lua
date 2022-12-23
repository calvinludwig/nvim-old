return {
	'nvim-lua/plenary.nvim',
	'dstein64/vim-startuptime',

	-- LSP
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'simrat39/rust-tools.nvim',
	'nanotee/sqls.nvim',

	-- CMP
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-cmdline',
	'petertriho/cmp-git',
	'hrsh7th/cmp-nvim-lsp-document-symbol',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-nvim-lua',
	'onsails/lspkind.nvim',

	-- SNIPPETS
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',

	-- ui
	'kyazdani42/nvim-web-devicons',
	{ 'catppuccin/nvim', name = 'catppuccin' },
	'feline-nvim/feline.nvim',
	'nvim-lualine/lualine.nvim',
	'rcarriga/nvim-notify',
	'stevearc/dressing.nvim',
	{ 'folke/noice.nvim', dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } },
	'folke/trouble.nvim',

	-- telescope
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.0' },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'nvim-telescope/telescope-file-browser.nvim',
	'nvim-telescope/telescope-ui-select.nvim',

	-- treesitter
	'ThePrimeagen/harpoon',
	{
		'nvim-treesitter/nvim-treesitter',
		build = function() require('nvim-treesitter.install').update { with_sync = true } end,
	},
	'nvim-treesitter/nvim-treesitter-context',
	'JoosepAlviste/nvim-ts-context-commentstring',
	'windwp/nvim-autopairs',
	'windwp/nvim-ts-autotag',
	'numToStr/Comment.nvim',

	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive',

	'jose-elias-alvarez/null-ls.nvim',
	'jayp0521/mason-null-ls.nvim',
	{
		'ThePrimeagen/refactoring.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	},

	'ThePrimeagen/vim-be-good',
	'jwalton512/vim-blade',
}
