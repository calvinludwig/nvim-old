vim.o.background = "light"
local colorscheme = 3

if colorscheme == 0 then
	require("rose-pine").setup({
		--- @usage 'main' | 'moon'
		dark_variant = "moon",
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

if colorscheme == 2 then vim.cmd.colorscheme("oxocarbon") end

if colorscheme == 3 then
	require("nightfox").setup({
		options = {
			styles = {
				comments = "italic",
				keywords = "bold",
				types = "italic,bold",
			},
		},
	})

	vim.cmd.colorscheme("carbonfox")
end
