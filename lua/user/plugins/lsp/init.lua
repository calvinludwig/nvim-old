require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" }
})
local telescope = require("telescope.builtin")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
local on_attach = function(_, _)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" })

    vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "LSP Definition" })
    vim.keymap.set("n", "gi", telescope.lsp_implementations, { desc = "LSP implementation" })
    vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "LSP References" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
end

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("user.plugins.lsp.cmp")
require("user.plugins.lsp.null-ls")
