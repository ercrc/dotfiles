local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Material (Gogh)'
config.enable_tab_bar = false
config.window_background_opacity = 0.94

return config 
