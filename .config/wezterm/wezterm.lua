local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "xterm-256color"

-- Depending on the front_end, colors may look more saturated.
-- In order to achieve the same result like using iTerm, the front_end
-- should be "WebGpu". Setting the front_end to "OpenGL" will result
-- in slightly over-saturated colors.
-- See https://wezfurlong.org/wezterm/config/lua/config/front_end.html
config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.initial_rows = 40
config.initial_cols = 120

-- Use ALT in order to make links clickable inside of a tmux session.
-- Defaults to SHIFT.
config.bypass_mouse_reporting_modifiers = "ALT"

-- Use pt as unit in order to get the same visual result on an external display
-- and the internal retina display of a MacBook.
config.window_padding = {
	left = "9pt",
	right = "9pt",
	top = "4pt",
	bottom = "4pt",
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16
config.bold_brightens_ansi_colors = true

config.default_cursor_style = "SteadyBlock"

config.color_scheme = "Tokyo Night Storm"

local winMaximizedStates = {}

config.keys = {
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "\r",
		mods = "CMD",
		action = wezterm.action_callback(function(win, pane)
			-- Toggle size of active window to be maximized (not fullscreen)
			-- or restored to the initial size.
			if winMaximizedStates[win.window_id] then
				win:restore()
				winMaximizedStates[win.window_id] = false
			else
				win:maximize()
				winMaximizedStates[win.window_id] = true
			end
		end),
	},
}

return config
