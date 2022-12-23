local treesitter_exists, treesitter = pcall(require, 'nvim-treesitter.configs')
if not treesitter_exists then
	vim.notify('plugin treesitter not installed', 'error')
	return
end

-- configure treesitter
treesitter.setup {
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = {
		'c',
		'cpp',
		'go',
		'lua',
		'python',
		'rust',
		'typescript',
		'help',
		'regex',
		'bash',
		'markdown',
		'markdown_inline',
	},

	highlight = { enable = true, additional_vim_regex_highlighting = false },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<c-space>',
			node_incremental = '<c-space>',
			scope_incremental = '<c-s>',
			node_decremental = '<c-backspace>',
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['aa'] = '@parameter.outer',
				['ia'] = '@parameter.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
	},
}

local ts_context_exists, ts_context = pcall(require, 'treesitter-context')
if not ts_context_exists then
	vim.notify('plugin ts_context not installed', 'error')
	return
end

ts_context.setup { enabled = true }
