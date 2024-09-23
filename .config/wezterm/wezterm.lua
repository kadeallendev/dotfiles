-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Load config table
local config = wezterm.config_builder()

config.color_scheme = "rose-pine"

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

-- UI
config.enable_tab_bar = false

config.adjust_window_size_when_changing_font_size = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

return config
