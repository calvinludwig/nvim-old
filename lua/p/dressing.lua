local dressing_exists, dressing = pcall(require, 'dressing')
if not dressing_exists then
	vim.notify('plugin dressing not installed', 'error')
	return
end
dressing.setup {}
