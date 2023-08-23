-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Solarized (light) (terminal.sexy)'
config.color_scheme = 'Solarized Light (Gogh)'
config.font_size = 14.0
config.font = wezterm.font 'Source Code Pro for Powerline'
-- config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.hide_mouse_cursor_when_typing = false
config.default_cursor_style = 'BlinkingBar'

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  -- active_titlebar_bg = '#ffffd7',
  active_titlebar_bg = '#FDF6E3',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#D6D1BC',
}

-- config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    -- background = '#FDF6E3',
    -- background = '#D3CBB8',
    -- background = '#D9D2C3',

    -- The active tab is the one that has focus in the window
    active_tab = {
      bg_color = '#FDF6E3',
      fg_color = '#555451',
      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Bold',
      underline = 'None',
      italic = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#D1CAB9',
      fg_color = '#808080',
      intensity = 'Half',
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

config.keys = {
    {key="P", mods="CTRL",
     action=wezterm.action{QuickSelectArgs={
       patterns={
          "https?://\\S+"
       },
       action = wezterm.action_callback(function(window, pane)
          local url = window:get_selection_text_for_pane(pane)
          wezterm.log_info("opening: " .. url)
          wezterm.open_with(url)
       end)
     }}
   },
  }



-- and finally, return the configuration to wezterm
return config

