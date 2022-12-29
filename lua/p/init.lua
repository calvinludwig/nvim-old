local notify_plugin_not_found = function(opts)
	vim.notify(opts.args, 'error', {
		title = 'PLUGIN NOT FOUND',
	})
end

vim.api.nvim_create_user_command('NotifyPluginNotFound', notify_plugin_not_found, { nargs = 1 })

require 'p.notify'

require 'p.treesitter'
require 'p.autopairs'
require 'p.comment'

require 'p.luasnip'
require 'p.cmp'
require 'p.lsp'

require 'p.catppuccin'
require 'p.gitsigns'

require 'p.telescope'
require 'p.harpoon'
require 'p.bufferline'
require 'p.trouble'
