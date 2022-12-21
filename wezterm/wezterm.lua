local wezterm = require 'wezterm';

local custom = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
custom.background = '#000000'

return {
  enable_wayland = true,
  font = wezterm.font_with_fallback({
    {
      family='JetBrainsMono Nerd Font',
    },
    'SauceCodePro Nerd Font Mono',
  }),
  font_size = 12,
  enable_tab_bar = false,
  skip_close_confirmation_for_processes_named = {
    'bash',
    'fish',
  },
  default_cursor_style = 'BlinkingBar',
  ssh_backend = 'Ssh2',
  color_schemes = {
    ['OLEDppuccin'] = custom,
  },
  color_scheme = 'OLEDppuccin',
}