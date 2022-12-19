return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'lewis6991/impatient.nvim'
	use 'dstein64/vim-startuptime'

	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'simrat39/rust-tools.nvim'
	use 'nanotee/sqls.nvim'

	-- CMP
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-cmdline'
	use 'petertriho/cmp-git'
	use 'hrsh7th/cmp-nvim-lsp-document-symbol'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lua'
	use 'onsails/lspkind.nvim'

	-- SNIPPETS
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'

	-- ui
	use 'kyazdani42/nvim-web-devicons'
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use 'feline-nvim/feline.nvim'
	use 'rcarriga/nvim-notify'
	use 'stevearc/dressing.nvim'
	use { 'folke/noice.nvim', requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } }
	use 'folke/trouble.nvim'

	-- telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }
	use { 'nvim-telescope/telescope-ui-select.nvim' }
	use 'ThePrimeagen/harpoon'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update { with_sync = true } end,
	}
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'
	use 'numToStr/Comment.nvim'

	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'

	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jayp0521/mason-null-ls.nvim'
	use {
		'ThePrimeagen/refactoring.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	}

	use 'ThePrimeagen/vim-be-good'
	use 'jwalton512/vim-blade'
end)
