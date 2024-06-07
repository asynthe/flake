local wezterm = require "wezterm"
local act = wezterm.action

local keybinds = {
  -- Main
  { key = 'i', mods = 'CTRL', action = act.ShowDebugOverlay },

  -- Clipboard
  { key = 'c', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

  -- Keys
  { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = true }, },
  { key = 'w', mods = 'SHIFT|CTRL', action = act.SpawnWindow },

  -- Pane
  -- { key = '\', mods = 'SHIFT|CTRL', action = act.SplitVertical },
  -- { key = '\', mods = 'CTRL', action = act.SplitHorizontal },

  -- Pane focus
  { key = 'h', mods = 'SUPER', action = act.ActivatePaneDirection("Left") },
  { key = 'j', mods = 'SUPER', action = act.ActivatePaneDirection("Down") },
  { key = 'k', mods = 'SUPER', action = act.ActivatePaneDirection("Up") },
  { key = 'l', mods = 'SUPER', action = act.ActivatePaneDirection("Right") },

  -- Pane Split
  { key = 'l', mods = 'SUPER|SHIFT', action = act.SplitPane({ direction = "Right" }) },
  { key = 'j', mods = 'SUPER|SHIFT', action = act.SplitPane({ direction = "Down" }) },

  -- Workspaces with Super
  -- { key = '1', mods = 'SUPER', action = act.ActivateTab=0 },
  -- { key = '2', mods = 'SUPER', action = act.ActivateTab=1 },
  -- { key = '3', mods = 'SUPER', action = act.ActivateTab=2 },
  -- { key = '4', mods = 'SUPER', action = act.ActivateTab=3 },
  -- { key = '5', mods = 'SUPER', action = act.ActivateTab=4 },
  -- { key = '6', mods = 'SUPER', action = act.ActivateTab=5 },
  -- { key = '7', mods = 'SUPER', action = act.ActivateTab=6 },
  -- { key = '8', mods = 'SUPER', action = act.ActivateTab=7 },
  -- { key = '9', mods = 'SUPER', action = act.ActivateTab=8 },
  -- { key = '0', mods = 'SUPER', action = act.ActivateTab=9 },
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
