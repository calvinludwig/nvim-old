local notify_exists, notify = pcall(require, 'notify')
if not notify_exists then
	vim.notify('plugin notify not installed', 'error')
	return
end

vim.notify = notify

notify.setup {
	background_colour = '#2e2e2e',
}
