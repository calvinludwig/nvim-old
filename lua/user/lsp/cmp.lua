local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup {
	view = {
		entries = 'custom', -- can be "custom", "wildmenu" or "native"
	},
	mapping = cmp.mapping.preset.insert {
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	snippet = {
		expand = function(args) require('luasnip').lsp_expand(args.body) end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		format = function(entry, vim_item)
			if vim.tbl_contains({ 'path' }, entry.source.name) then
				local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
				if icon then
					vim_item.kind = icon
					vim_item.kind_hl_group = hl_group
					return vim_item
				end
			end
			return lspkind.cmp_format {
				mode = 'symbol_text',
				menu = {
					buffer = '[Buffer]',
					nvim_lsp = '[LSP]',
					luasnip = '[LuaSnip]',
					nvim_lua = '[Lua]',
					latex_symbols = '[Latex]',
				},
			}(entry, vim_item)
		end,
	},
}

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
})

require('cmp_git').setup()

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({ { name = 'cmp_git' } }, { { name = 'buffer' } }),
})
