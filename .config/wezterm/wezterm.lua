local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font = wezterm.font 'JetBrainsMono NF'
config.harfbuzz_features = {'liga=1'}

return config
