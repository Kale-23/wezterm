local wezterm = require 'wezterm'
-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

local SOLID_LEFT_CIRLCE = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_CIRLCE = wezterm.nerdfonts.ple_right_half_circle_thick
local module = {}

function module.apply_to_config(config)
    config.use_fancy_tab_bar = true
    config.window_frame = {
     font = wezterm.font { family = 'Fira Code', weight = 'Light' },
        font_size = 10,
        active_titlebar_bg = '#090909'
    }
    wezterm.on(
      'format-tab-title',
      function(tab, _, _, _, hover, max_width)
        local edge_background = '#303446'
        local background = '#9399b2'
        local foreground = '#11111b'

        if tab.is_active then
          background = '#b4befe'
          foreground = '#11111b'
        elseif hover then
          background = '#a6e3a1'
          foreground = '#11111b'
        end

        local edge_foreground = background

        local title = tab_title(tab)

        -- ensure that the titles fit in the available space,
        -- and that we have room for the edges.
        title = wezterm.truncate_right(title, max_width - 2)

        return {
          { Background = { Color = edge_background } },
          { Foreground = { Color = edge_foreground } },
          { Text = SOLID_LEFT_CIRLCE },
          { Background = { Color = background } },
          { Foreground = { Color = foreground } },
          { Text = title },
          { Background = { Color = edge_background } },
          { Foreground = { Color = edge_foreground } },
          { Text = SOLID_RIGHT_CIRLCE },
        }
      end
    )
end

return module
