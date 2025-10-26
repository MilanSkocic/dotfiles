-- API
local wezterm = require("wezterm")

-- config
local config = wezterm.config_builder()

-- theme
config.color_scheme = 'Catppuccin Mocha'


-- font
config.font_size = 14
-- config.dpi=110
config.font = wezterm.font("UbuntuMono Nerd Font Mono")
config.adjust_window_size_when_changing_font_size = false


-- appearance
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE|TITLE"
config.window_padding = {left=0, right=0, top=0, bottom=0}
config.window_background_opacity=0.95
config.initial_cols = 130
config.initial_rows = 30


-- key maps
config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = '/',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}


-- auto reload
config.automatically_reload_config = true


-- return config
return config
