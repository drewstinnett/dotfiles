-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_decorations = "RESIZE"
config.color_scheme = 'Solarized Light (Gogh)'
config.font_size = 14.0
config.font = wezterm.font 'Source Code Pro for Powerline'
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.hide_mouse_cursor_when_typing = false
config.default_cursor_style = 'BlinkingBar'
config.selection_word_boundary = " \t\n={[}]()\"'"
config.window_close_confirmation = 'AlwaysPrompt'

config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font_size = 12.0,
  active_titlebar_bg = '#FDF6E3',
  inactive_titlebar_bg = '#D6D1BC',
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
  {
    event = { Down = { streak = 2, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'Cell',
    mods = 'NONE',
  },
}

config.ssh_domains = {
  {
    -- This name identifies the domain
    name = 'home',
    -- The hostname or address to connect to. Will be used to match settings
    -- from your ssh config file
    remote_address = 'h.drewlink.com',
    -- The username to use on the remote host
    username = 'drews',
  },
}


config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = '#FDF6E3',
      fg_color = '#555451',
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
    {
      key = "P", mods="CTRL",
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
   {
      key = 't', mods = 'CMD',
      action = wezterm.action.SpawnCommandInNewTab {
        cwd = wezterm.home_dir
      },
    },
    {
      key = 'f', mods = 'SHIFT|CMD',
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = 'p', mods = 'SHIFT|CMD',
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      key = '.', mods = 'CMD',
      action = act.EmitEvent 'trigger-password-input'
    },
    {
      key = ',', mods = 'CMD',
      action = act.EmitEvent 'trigger-ssh-key-input'
    },
}

wezterm.on('trigger-ssh-key-input', function(window, pane)
  local success, stdout, stderr = wezterm.run_child_process {
    '/opt/homebrew/bin/op', 'item', 'get', '--reveal', '--fields', 'password', 'Admin-Serv Personal SSH Key'
  }
  pane:send_text(stdout)
end)

wezterm.on('trigger-password-input', function(window, pane)
  local success, stdout, stderr = wezterm.run_child_process {
    '/opt/homebrew/bin/op', 'item', 'get', '--reveal', '--fields', 'password', 'drews-p admin account'
  }
  pane:send_text(stdout)
end)

-- and finally, return the configuration to wezterm
return config
