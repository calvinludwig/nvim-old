local cmp_exists, cmp = pcall(require, 'cmp')
if not cmp_exists then
	vim.notify('plugin cmp not installed', 'error')
	return
end

local luasnip_exists, luasnip = pcall(require, 'luasnip')
if not luasnip_exists then
	vim.notify('plugin luasnip not installed', 'error')
	return
end

require('luasnip.loaders.from_vscode').lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

cmp.setup {
	snippet = {
		expand = function(args) luasnip.lsp_expand(args.body) end,
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
			elseif has_words_before() then
				cmp.complete()
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
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'path' },
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
}

local lspkind_exists, lspkind = pcall(require, 'lspkind')
if not lspkind_exists then
	vim.notify('plugin lspkind not installed', 'error')
else
	cmp.setup {
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
end

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
