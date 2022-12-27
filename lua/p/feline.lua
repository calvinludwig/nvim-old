local feline_exists, feline = pcall(require, 'feline')
if not feline_exists then
	vim.notify('plugin feline not installed', 'error')
	return
end

local noir_exists, noir = pcall(require, 'noirbuddy.colors')
if not noir_exists then
	vim.notify('plugin noir not installed', 'error')
	return
end

local colors = noir.all()

local M = {}

local lsp = require 'feline.providers.lsp'
local lsp_severity = vim.diagnostic.severity
local b = vim.b

local assets = {
	left_separator = '',
	right_separator = '',
	bar = '',
	mode_icon = ' ',
	dir = '  ',
	file = '  ',
	lsp = {
		server = '  ',
		error = '  ',
		warning = '  ',
		info = '  ',
		hint = '  ',
	},
	git = {
		branch = '  ',
		added = '  ',
		changed = '  ',
		removed = '  ',
	},
}

local sett = {
	text = colors.noir_0,
	bkg = colors.noir_9,
	diffs = colors.noir_8,
	extras = colors.noir_1,
	curr_file = colors.noir_8,
	curr_dir = colors.noir_7,
	show_modified = false,
}

local mode_colors = {
	['n'] = { 'NORMAL', colors.noir_7 },
	['no'] = { 'N-PENDING', colors.noir_7 },

	['i'] = { 'INSERT', colors.primary },
	['ic'] = { 'INSERT', colors.primary },
	['t'] = { 'TERMINAL', colors.primary },
	['!'] = { 'SHELL', colors.primary },

	['v'] = { 'VISUAL', colors.secondary },
	['V'] = { 'V-LINE', colors.secondary },
	[''] = { 'V-BLOCK', colors.secondary },

	['R'] = { 'REPLACE', colors.diagnostic_info },
	['Rv'] = { 'V-REPLACE', colors.diagnostic_info },
	['s'] = { 'SELECT', colors.diagnostic_info },
	['S'] = { 'S-LINE', colors.diagnostic_info },
	[''] = { 'S-BLOCK', colors.diagnostic_info },

	['c'] = { 'COMMAND', colors.diagnostic_warning },
	['cv'] = { 'COMMAND', colors.diagnostic_warning },
	['ce'] = { 'COMMAND', colors.diagnostic_warning },

	['r'] = { 'PROMPT', colors.diff_change },
	['rm'] = { 'MORE', colors.diff_change },

	['r?'] = { 'CONFIRM', colors.diff_add},
}

function M.setup(opts)
	if opts then
		opts.assets = opts.assets or {}
		opts.sett = opts.sett or {}
		opts.mode_colors = opts.mode_colors or {}
	else
		opts = {}
	end
	assets = vim.tbl_deep_extend('force', assets, opts.assets)
	sett = vim.tbl_deep_extend('force', sett, opts.sett)
	mode_colors = vim.tbl_deep_extend('force', mode_colors, opts.mode_colors)
end

function M.get()
	local shortline = false

	local components = {
		active = { {}, {}, {} }, -- left, center, right
		inactive = { {} },
	}

	local function is_enabled(min_width)
		if shortline then return true end

		return vim.api.nvim_win_get_width(0) > min_width
	end

	-- global components
	local invi_sep = {
		str = ' ',
		hl = {
			fg = sett.bkg,
			bg = sett.bkg,
		},
	}

	-- helpers
	local function any_git_changes()
		local gst = b.gitsigns_status_dict -- git stats
		if gst then
			if
				gst['added'] and gst['added'] > 0
				or gst['removed'] and gst['removed'] > 0
				or gst['changed'] and gst['changed'] > 0
			then
				return true
			end
		end
		return false
	end

	-- #################### STATUSLINE ->

	-- ######## Left

	-- Current vi mode ------>
	local vi_mode_hl = function()
		return {
			fg = sett.text,
			bg = mode_colors[vim.fn.mode()][2],
			style = 'bold',
		}
	end

	components.active[1][1] = {
		provider = assets.bar,
		hl = function()
			return {
				fg = mode_colors[vim.fn.mode()][2],
				bg = sett.bkg,
			}
		end,
	}

	components.active[1][2] = {
		provider = assets.mode_icon,
		hl = function()
			return {
				fg = sett.text,
				bg = mode_colors[vim.fn.mode()][2],
			}
		end,
	}

	components.active[1][3] = {
		provider = function() return ' ' .. mode_colors[vim.fn.mode()][1] .. ' ' end,
		hl = vi_mode_hl,
	}

	-- there is a dilema: we need to hide Diffs if ther is no git info. We can do that, but this will
	-- leave the right_separator colored with purple, and since we can't change the color conditonally
	-- then the solution is to create two right_separators: one with a mauve sett.bkg and the other one normal
	-- sett.bkg; both have the same fg (vi mode). The mauve one appears if there is git info, else the one with
	-- the normal sett.bkg appears. Fixed :)

	-- enable if git diffs are not available
	components.active[1][4] = {
		provider = assets.right_separator,
		hl = function()
			return {
				fg = mode_colors[vim.fn.mode()][2],
				bg = sett.bkg,
			}
		end,
		enabled = function() return not any_git_changes() end,
	}

	-- enable if git diffs are available
	components.active[1][5] = {
		provider = assets.right_separator,
		hl = function()
			return {
				fg = mode_colors[vim.fn.mode()][2],
				bg = sett.diffs,
			}
		end,
		enabled = function() return any_git_changes() end,
	}
	-- Current vi mode ------>

	-- Diffs ------>
	components.active[1][6] = {
		provider = 'git_diff_added',
		hl = {
			fg = sett.text,
			bg = sett.diffs,
		},
		icon = assets.git.added,
	}

	components.active[1][7] = {
		provider = 'git_diff_changed',
		hl = {
			fg = sett.text,
			bg = sett.diffs,
		},
		icon = assets.git.changed,
	}

	components.active[1][8] = {
		provider = 'git_diff_removed',
		hl = {
			fg = sett.text,
			bg = sett.diffs,
		},
		icon = assets.git.removed,
	}

	components.active[1][9] = {
		provider = '█' .. assets.right_separator,
		hl = {
			fg = sett.diffs,
			bg = sett.bkg,
		},
		enabled = function() return any_git_changes() end,
	}
	-- Diffs ------>

	-- Extras ------>

	-- file progess
	components.active[1][10] = {
		provider = function()
			local current_line = vim.fn.line '.'
			local total_line = vim.fn.line '$'

			if current_line == 1 then
				return ' Top '
			elseif current_line == vim.fn.line '$' then
				return ' Bot '
			end
			local result, _ = math.modf((current_line / total_line) * 100)
			return ' ' .. result .. '%% '
		end,
		-- enabled = shortline or function(winid)
		-- 	return vim.api.nvim_win_get_width(winid) > 90
		-- end,
		hl = {
			fg = sett.extras,
			bg = sett.bkg,
		},
		left_sep = invi_sep,
	}

	-- position
	components.active[1][11] = {
		provider = 'position',
		-- enabled = shortline or function(winid)
		-- 	return vim.api.nvim_win_get_width(winid) > 90
		-- end,
		hl = {
			fg = sett.extras,
			bg = sett.bkg,
		},
		left_sep = invi_sep,
	}

	-- macro
	components.active[1][12] = {
		provider = 'macro',
		enabled = function() return vim.api.nvim_get_option 'cmdheight' == 0 end,
		hl = {
			fg = sett.extras,
			bg = sett.bkg,
		},
		left_sep = invi_sep,
	}

	-- search count
	components.active[1][13] = {
		provider = 'search_count',
		enabled = function() return vim.api.nvim_get_option 'cmdheight' == 0 end,
		hl = {
			fg = sett.extras,
			bg = sett.bkg,
		},
		left_sep = invi_sep,
	}
	-- Extras ------>

	-- ######## Left

	-- ######## Center

	-- Diagnostics ------>
	-- workspace loader
	components.active[2][1] = {
		provider = function()
			local Lsp = vim.lsp.util.get_progress_messages()[1]

			if Lsp then
				local msg = Lsp.message or ''
				local percentage = Lsp.percentage
				if not percentage then return '' end
				local title = Lsp.title or ''
				local spinners = {
					'',
					'',
					'',
				}
				local success_icon = {
					'',
					'',
					'',
				}
				local ms = vim.loop.hrtime() / 1000000
				local frame = math.floor(ms / 120) % #spinners

				if percentage >= 70 then
					return string.format(' %%<%s %s %s (%s%%%%) ', success_icon[frame + 1], title, msg, percentage)
				end

				return string.format(' %%<%s %s %s (%s%%%%) ', spinners[frame + 1], title, msg, percentage)
			end

			return ''
		end,
		enabled = is_enabled(80),
		hl = {
			fg = colors.primary,
			bg = sett.bkg,
		},
	}

	-- genral diagnostics (errors, warnings. info and hints)
	components.active[2][2] = {
		provider = 'diagnostic_errors',
		enabled = function() return lsp.diagnostics_exist(lsp_severity.ERROR) end,

		hl = {
			fg = colors.diagnostic_error,
			bg = sett.bkg,
		},
		icon = assets.lsp.error,
	}

	components.active[2][3] = {
		provider = 'diagnostic_warnings',
		enabled = function() return lsp.diagnostics_exist(lsp_severity.WARN) end,
		hl = {
			fg = colors.diagnostic_warning,
			bg = sett.bkg,
		},
		icon = assets.lsp.warning,
	}

	components.active[2][4] = {
		provider = 'diagnostic_info',
		enabled = function() return lsp.diagnostics_exist(lsp_severity.INFO) end,
		hl = {
			fg = colors.diagnostic_info,
			bg = sett.bkg,
		},
		icon = assets.lsp.info,
	}

	components.active[2][5] = {
		provider = 'diagnostic_hints',
		enabled = function() return lsp.diagnostics_exist(lsp_severity.HINT) end,
		hl = {
			fg = colors.diagnostic_hint,
			bg = sett.bkg,
		},
		icon = assets.lsp.hint,
	}
	-- Diagnostics ------>

	-- ######## Center

	-- ######## Right

	components.active[3][1] = {
		provider = 'git_branch',
		enabled = is_enabled(70),
		hl = {
			fg = sett.extras,
			bg = sett.bkg,
		},
		icon = assets.git.branch,
		left_sep = invi_sep,
		right_sep = invi_sep,
	}

	components.active[3][2] = {
		provider = function()
			if next(vim.lsp.buf_get_clients()) ~= nil then
				return assets.lsp.server .. 'Lsp'
			else
				return ''
			end
		end,
		hl = {
			fg = sett.extras,
			bg = sett.bkg,
		},
		right_sep = invi_sep,
	}

	components.active[3][3] = {
		provider = function()
			local filename = vim.fn.expand '%:t'
			local extension = vim.fn.expand '%:e'
			local icon = require('nvim-web-devicons').get_icon(filename, extension)
			if icon == nil then icon = assets.file end
			return (sett.show_modified and '%m' or '') .. ' ' .. icon .. ' ' .. filename .. ' '
		end,
		enabled = is_enabled(70),
		hl = {
			fg = sett.text,
			bg = sett.curr_file,
		},
		left_sep = {
			str = assets.left_separator,
			hl = {
				fg = sett.curr_file,
				bg = sett.bkg,
			},
		},
	}

	components.active[3][4] = {
		provider = function()
			local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
			return assets.dir .. dir_name .. ' '
		end,
		enabled = is_enabled(80),
		hl = {
			fg = sett.text,
			bg = sett.curr_dir,
		},
		left_sep = {
			str = assets.left_separator,
			hl = {
				fg = sett.curr_dir,
				bg = sett.curr_file,
			},
		},
	}
	-- ######## Right

	-- Inanctive components
	components.inactive[1][1] = {
		provider = function() return ' ' .. string.upper(vim.bo.ft) .. ' ' end,
		hl = {
			fg = colors.noir_5,
			bg = colors.background,
		},
	}

	return components
end

feline.setup {
	components = M.get(),
}
