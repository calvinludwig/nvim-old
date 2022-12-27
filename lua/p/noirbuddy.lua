local noir_exists, noir = pcall(require, 'noirbuddy')
if not noir_exists then
	vim.notify('plugin noir not installed', 'error')
	return
end

noir.setup {
	colors = {
		noir_0 = '#ffffff', -- `noir_0` is light for dark themes, and dark for light themes
		noir_1 = '#e8e8e8',
		noir_2 = '#d1d1d1',
		noir_3 = '#bababa',
		noir_4 = '#a3a3a3',
		noir_5 = '#8c8c8c',
		noir_6 = '#757575',
		noir_7 = '#5e5e5e',
		noir_8 = '#474747',
		noir_9 = '#303030', -- `noir_9` is dark for dark themes, and light for light themes
        background = '#1a1a1a'
	},
}
