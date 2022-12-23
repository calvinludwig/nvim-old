local trouble_exists, trouble = pcall(require, 'trouble')
if not trouble_exists then
	vim.notify('plugin trouble not installed', 'error')
	return
end

trouble.setup {
	mode = 'document_diagnostics',
	auto_open = false,
	auto_close = true,
}
