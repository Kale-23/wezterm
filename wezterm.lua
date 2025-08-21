local wezterm = require 'wezterm'
local keys = require 'keys'
local customize = require 'customize'
local tabs = require 'tabs'

local config = wezterm.config_builder()

config.enable_wayland = false
config.use_dead_keys = false
config.scrollback_lines = 5000

keys.apply_to_config(config)
customize.apply_to_config(config)
tabs.apply_to_config(config)

return config
