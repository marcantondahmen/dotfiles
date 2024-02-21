local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "xterm-256color"

-- This must be set to WebGpu in order to fix color issues.
config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.initial_rows = 40
config.initial_cols = 120

config.window_padding = {
	left = 8,
	right = 8,
	top = 4,
	bottom = 4,
}

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16
config.bold_brightens_ansi_colors = true

config.default_cursor_style = "SteadyBlock"

config.color_scheme = "Tokyo Night Storm"

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
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
