local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
    -- screen 
    config.native_macos_fullscreen_mode = true
    config.hide_tab_bar_if_only_one_tab = true
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.window_background_opacity = 0.9
    config.macos_window_background_blur = 10
    config.window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0cell',
    }
    --config.window_background_image = "Users/kale/.config/wezterm/trial.png"
    --config.window_background_image_hsb = {
    --  brightness = 0.2,
    --  hue = 1,
    --  saturation = 1,
    --}
    config.inactive_pane_hsb = {
     saturation = 0.9,
     brightness = 0.7,
    }

    -- font
    config.font = wezterm.font 'FiraCode Nerd Font Mono'
    config.font_size = 20

    -- color
    config.color_scheme = 'Catppuccin Frappe'

end

return module
