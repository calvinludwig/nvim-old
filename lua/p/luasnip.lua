local ls_exists, ls = pcall(require, 'luasnip')
if not ls_exists then
	vim.notify('plugin ls not installed', 'error')
	return
end

local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local r = ls.restore_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local types = require 'luasnip.util.types'

local same = function(index)
	return f(function(arg) return arg[1] end, { index })
end

ls.add_snippets('lua', {
	s(
		'pcr',
		fmt(
			[[
local {var1}_exists, {var2} = pcall(require, '{module}')
if not {var3}_exists then
    vim.notify('plugin {var4} not installed', 'error')
    return
end
            ]],
			{
				var1 = i(1),
				module = i(0),
				var2 = same(1),
				var3 = same(1),
				var4 = same(1),
			}
		)
	),
})
