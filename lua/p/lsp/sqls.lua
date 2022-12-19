require('lspconfig').sqls.setup {
	on_attach = function(client, bufnr)
		vim.notify('sqls attach', 'info')
		require('sqls').on_attach(client, bufnr)
	end,
}
