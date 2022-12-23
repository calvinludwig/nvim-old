local autopairs_exists, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_exists then
	vim.notify('plugin autopairs not installed', 'error')
	return
end

autopairs.setup {
	check_ts = true,
}

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_exists, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_exists then return end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_exists, cmp = pcall(require, 'cmp')
if not cmp_exists then return end

-- make autopairs and completion work together
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
