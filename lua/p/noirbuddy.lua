local noir_exists, noir = pcall(require, 'noirbuddy')
if not noir_exists then
	vim.notify('plugin noir not installed', 'error')
	return
end

noir.setup {
	colors = {
		primary = '#db2777',
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
		background = '#1a1a1a',
	},
}

local colorbuddy_exists, colorbuddy = pcall(require, 'colorbuddy')
if not colorbuddy_exists then
	vim.notify('plugin colorbuddy not installed', 'error')
	return
end
-- Require colorbuddy...
colorbuddy.setup()
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group

Color.new('dark', '#0e0e0e')
Color.new('green', '#059669')
Color.new('dark_indigo', '#713f12')

-- Override specific highlight groups...
Group.new('TelescopeTitle', colors.primary)
Group.new('@comment', colors.dark_indigo:dark())
Group.new('Comment', colors.dark_indigo)
Group.new('CursorLineNr', colors.secondary, colors.dark)
Group.new('CursorLine', nil, colors.dark)
Group.new('CursorColumn', nil, colors.dark)
Group.new('@string', colors.green)
Group.new('String', colors.green)
