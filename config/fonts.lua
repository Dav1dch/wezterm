local wezterm = require("wezterm")
local platform = require("utils.platform")

local font = "Cascadia Mono NF"
local font_size = platform().is_mac and 16 or 12
local font_family = platform().is_mac and { weight = "Light", italic = false } or { italic = false }
-- local font_size = 16

return {
  font = wezterm.font(font, font_family),
  font_size = font_size,

  --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  freetype_load_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = "Normal", ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
