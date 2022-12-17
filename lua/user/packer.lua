return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- LSP
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'glepnir/lspsaga.nvim',
		'j-hui/fidget.nvim',
	}

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

	use { 'catppuccin/nvim', as = 'catppuccin' }

	use 'kyazdani42/nvim-web-devicons'

	-- lines
	use 'feline-nvim/feline.nvim'
	-- telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope-file-browser.nvim' }
	use { 'nvim-telescope/telescope-ui-select.nvim' }
	use 'ThePrimeagen/harpoon'
	use 'rcarriga/nvim-notify'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update { with_sync = true } end,
	}
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'

	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'

    use 'folke/zen-mode.nvim'

	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jayp0521/mason-null-ls.nvim'
	use 'simrat39/rust-tools.nvim'
	use {
		'ThePrimeagen/refactoring.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
	}

	use 'ThePrimeagen/vim-be-good'
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'jwalton512/vim-blade'
end)
