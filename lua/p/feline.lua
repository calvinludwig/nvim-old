local feline_exists, feline = pcall(require, 'feline')
if not feline_exists then
	vim.notify('plugin feline not installed', 'error')
	return
end

local ctp_feline_exists, ctp_feline = pcall(require, 'catppuccin.groups.integrations.feline')
if not ctp_feline_exists then
	vim.notify('plugin ctp_feline not installed', 'error')
	feline.setup {}
	return
else
	local U = require 'catppuccin.utils.colors'
	local mocha = require('catppuccin.palettes').get_palette 'mocha'
	local clrs = require('catppuccin.palettes').get_palette()

	ctp_feline.setup {
		assets = {
			left_separator = '',
			right_separator = '',
			bar = '█',
			mode_icon = '  ',
			dir = '  ',
			file = '   ',
			lsp = {
				server = '  ',
				error = '  ',
				warning = '  ',
				info = '  ',
				hint = '  ',
			},
			git = {
				branch = '  ',
				added = '  ',
				changed = '  ',
				removed = '  ',
			},
		},
		sett = {
			bkg = U.vary_color({ mocha = mocha.mantle }),
		},
	}

	feline.setup {
		components = ctp_feline.get(),
	}

	vim.api.nvim_create_autocmd('ColorScheme', {
		pattern = '*',
		callback = function()
			package.loaded['feline'] = nil
			package.loaded['catppuccin.groups.integrations.feline'] = nil
			require('feline').setup {
				components = require('catppuccin.groups.integrations.feline').get(),
			}
		end,
	})
end
