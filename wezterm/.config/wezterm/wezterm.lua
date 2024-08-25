local wezterm = require('wezterm')

local config = wezterm.config_builder()
local isLinux = wezterm.target_triple:find('linux') ~= nil

config.term = 'xterm-256color'

-- Depending on the front_end, colors may look more saturated.
-- In order to achieve the same result like using iTerm, the front_end
-- should be "WebGpu". Setting the front_end to "OpenGL" will result
-- in slightly over-saturated colors.
-- See https://wezfurlong.org/wezterm/config/lua/config/front_end.html
config.front_end = 'WebGpu'

config.window_decorations = 'RESIZE'
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.initial_rows = 40
config.initial_cols = 120

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.bold_brightens_ansi_colors = true

config.default_cursor_style = 'SteadyBlock'

config.color_scheme = 'Tokyo Night Storm'

-- Use ALT in order to make links clickable inside of a tmux session.
-- Defaults to SHIFT.
config.bypass_mouse_reporting_modifiers = 'ALT'

local winMaximizedStates = {}

if isLinux then
	-- Linux

	config.window_padding = {
		left = '4pt',
		right = '4pt',
		top = '4pt',
		bottom = '4pt',
	}

	config.font_size = 12

	config.keys = {
		{
			key = 'v',
			mods = 'CTRL',
			action = wezterm.action.PasteFrom('Clipboard'),
		},
		{
			key = 'w',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},
	}
else
	-- macOS

	-- Use pt as unit in order to get the same visual result on an external display
	-- and the internal retina display of a MacBook.
	config.window_padding = {
		left = '7pt',
		right = '7pt',
		top = '7pt',
		bottom = '7pt',
	}

	-- Add both possible locations (Intel and Apple Silicon)
	-- for fonts that have been installed with brew.
	-- These directories should be preferred over the user fonts directory
	-- since there outdate fonts could be mixed in one family
	-- (for example after renames in nerd fonts).
	config.font_dirs = {
		'/opt/homebrew/Caskroom',
		'/usr/local/Caskroom',
	}

	config.font_size = 16

	config.keys = {
		{
			key = 'v',
			mods = 'CMD',
			action = wezterm.action.PasteFrom('Clipboard'),
		},
		{
			key = 'w',
			mods = 'CMD',
			action = wezterm.action.CloseCurrentTab({ confirm = false }),
		},
		-- Disable fullscreen since it is conflicting with AeroSpace.
		{
			key = '\r',
			mods = 'ALT',
			action = wezterm.action_callback(function(win, pane) end),
		},
	}
end

-- A fix for broken links in Markdown link.
-- see https://github.com/wez/wezterm/issues/3803#issuecomment-1608954312
config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = '\\((\\w+://\\S+)\\)',
		format = '$1',
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = '\\[(\\w+://\\S+)\\]',
		format = '$1',
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = '\\{(\\w+://\\S+)\\}',
		format = '$1',
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = '<(\\w+://\\S+)>',
		format = '$1',
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
		format = '$1',
		highlight = 1,
	},
	-- implicit mailto link
	{
		regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
		format = 'mailto:$0',
	},
}

return config
