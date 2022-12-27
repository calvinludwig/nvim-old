return {
	'nvim-lua/plenary.nvim',
	'kyazdani42/nvim-web-devicons',

	-- LSP
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'simrat39/rust-tools.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'jayp0521/mason-null-ls.nvim',

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

	-- colorschemes
	{ 'catppuccin/nvim', name = 'catppuccin' },
	{
		'jesseleite/nvim-noirbuddy',
		dependencies = { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
	},

	-- ui
	'rcarriga/nvim-notify',
	'folke/trouble.nvim',
	'feline-nvim/feline.nvim',
	{ 'akinsho/bufferline.nvim', version = 'v3.*' },
	'lewis6991/gitsigns.nvim',

	-- telescope
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.0' },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'nvim-telescope/telescope-file-browser.nvim',
	'nvim-telescope/telescope-ui-select.nvim',
	'ThePrimeagen/harpoon',

	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = function() require('nvim-treesitter.install').update { with_sync = true } end,
	},
	'nvim-treesitter/nvim-treesitter-context',
	'numToStr/Comment.nvim',
	'JoosepAlviste/nvim-ts-context-commentstring',
	'windwp/nvim-autopairs',
	'windwp/nvim-ts-autotag',

	'ThePrimeagen/vim-be-good',
	'jwalton512/vim-blade',
}
