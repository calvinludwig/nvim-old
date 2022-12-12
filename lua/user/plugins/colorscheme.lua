vim.o.background = "dark"
local colorscheme = 0

-- 0 = rose-pine
-- 1 = catppuccin
-- 2 = oxocarbon
-- 3 = enfocado

if colorscheme == 0 then
	require("rose-pine").setup({
		--- @usage 'main' | 'moon'
		dark_variant = "main",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = false,
		disable_float_background = false,
		disable_italics = false,
	})

	-- set colorscheme after options
	vim.cmd.colorscheme("rose-pine")
end

if colorscheme == 1 then
	require("catppuccin").setup({
		flavour = "mocha", -- latte, frappe, macchiato, mocha
	})

	vim.cmd.colorscheme("catppuccin")
end

if colorscheme == 2 then
	vim.cmd.colorscheme("oxocarbon")
end

if colorscheme == 3 then
	vim.g.enfocado_style = 'neon'
	vim.cmd.colorscheme("enfocado")
end
