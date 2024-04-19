local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.enable_tab_bar = false
config.window_background_opacity = 0.7

return config
