local platform = require("utils.platform")()
local wezterm = require("wezterm")

local options = {}
if wezterm.config_builder then
  options = wezterm.config_builder()
end

-- local options = {
--   default_prog = {},
--   launch_menu = {},
-- }
--
options.keys = {
  {
    key = "l",
    mods = "ALT",
    action = wezterm.action.ShowLauncher,
  },
}
if platform.is_win then
  options.default_prog = { "ubuntu.exe" }
  options.launch_menu = {
    { label = "ubuntu20", args = { "ubuntu2004.exe" } },
    { label = "PowerShell Desktop", args = { "powershell" } },
    { label = "Command Prompt", args = { "cmd" } },
    { label = "Nushell", args = { "nu" } },
    {
      label = "Git Bash",
      args = { "C:\\Users\\kevin\\scoop\\apps\\git\\current\\bin\\bash.exe" },
    },
  }
elseif platform.is_mac then
  options.default_prog = { "/bin/zsh", "-l" }
  options.launch_menu = {
    { label = "Bash", args = { "bash", "-l" } },
    { label = "Fish", args = { "/bin/fish", "-l" } },
    { label = "Nushell", args = { "/bin/nu", "-l" } },
    { label = "Zsh", args = { "zsh", "-l" } },
  }
elseif platform.is_linux then
  options.default_prog = { "fish", "-l" }
  options.launch_menu = {
    { label = "Bash", args = { "bash", "-l" } },
    { label = "Fish", args = { "fish", "-l" } },
    { label = "Zsh", args = { "zsh", "-l" } },
  }
end

return options
