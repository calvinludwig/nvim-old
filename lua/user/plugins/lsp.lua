local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'sumneko_lua',
  'gopls',
})

lsp.nvim_workspace()

lsp.setup()
