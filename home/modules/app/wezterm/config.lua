local wezterm = require "wezterm"
local act = wezterm.action

local keybinds = {
  -- Main
  { key = 'i', mods = 'CTRL', action = act.ShowDebugOverlay },

  -- Clipboard
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'ClipboardAndPrimarySelection' },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },

  -- Keys
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'z', mods = 'CTRL|SHIFT', action = act.TogglePaneZoomState },
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentPane { confirm = true }, }, -- This also closes the window if only one pane left.
  -- { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = true }, },

  -- Pane
  { key = '\\', mods = 'CTRL', action = act.SplitHorizontal },
  { key = '|', mods = 'CTRL|SHIFT', action = act.SplitVertical },

  -- Pane focus
  { key = 'h', mods = 'CTRL', action = act.ActivatePaneDirection("Left") },
  { key = 'j', mods = 'CTRL', action = act.ActivatePaneDirection("Down") },
  { key = 'k', mods = 'CTRL', action = act.ActivatePaneDirection("Up") },
  { key = 'l', mods = 'CTRL', action = act.ActivatePaneDirection("Right") },

  -- Pane resizing
  { key = 'h', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Left', 1 } },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Down', 1 } },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Up', 1 } },
  { key = 'l', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Right', 1 } },

  -- Workspaces with CTRL
  -- { key = '1', mods = 'CTRL', action = act.ActivateTab=0 },
  -- { key = '2', mods = 'CTRL', action = act.ActivateTab=1 },
  -- { key = '3', mods = 'CTRL', action = act.ActivateTab=2 },
  -- { key = '4', mods = 'CTRL', action = act.ActivateTab=3 },
  -- { key = '5', mods = 'CTRL', action = act.ActivateTab=4 },
  -- { key = '6', mods = 'CTRL', action = act.ActivateTab=5 },
  -- { key = '7', mods = 'CTRL', action = act.ActivateTab=6 },
  -- { key = '8', mods = 'CTRL', action = act.ActivateTab=7 },
  -- { key = '9', mods = 'CTRL', action = act.ActivateTab=-1 },

  -- for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  -- table.insert(config.keys, {
  --   key = tostring(i),
  --   mods = 'CTRL|ALT',
 --    action = act.ActivateTab(i - 1),
 --  })
}

return {
  -- Keys
  -- disable_default_key_bindings = true,
  keys = keybinds,

  -- Tab Bar
  hide_tab_bar_if_only_one_tab = true,
  -- hide_mouse_cursor_when_typing = true,

  -- Cursor
  -- cursor_blink_rate = 800,
  -- default_cursor_style = 'BlinklingBlock',
  -- default_cursor_style = 'BlinkingUnderline',

  -- Other
  alternate_buffer_wheel_scroll_speed = 1,
  window_close_confirmation = "NeverPrompt",
  audible_bell = 'Disabled',
  -- freetype_load_target = "Normal",
  -- freetype_load_flags = 'NO_AUTOHINT',

  -- Window Padding
  -- window_padding = {
  --  left = 0,
  --  right = 0,
  --  top = 0,
  --  bottom = 0,
  -- },
}
