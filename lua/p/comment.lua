local comment_exists, comment = pcall(require, 'Comment')
if not comment_exists then
	vim.notify('plugin comment not installed', 'error')
	return
end

comment.setup {
	pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
