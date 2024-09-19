-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {

  nvdash = {
    load_on_startup = true,

    header = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
      "                                     ",
      " ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ",
      " █ ▀██ ██ ▄▄▄██ ▄▄▄ ██ ███ █▄ ▄██ ▄▀▄ █ ",
      " █ █ █ ██ ▄▄▄██ ███ ███ █ ███ ███ █ █ █ ",
      " █ ██▄ ██ ▀▀▀██ ▀▀▀ ███▄▀▄██▀ ▀██ ███ █ ",
      " ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ",
    },
    buttons = {
      { "  Find File", "leader f f", "Telescope find_files" },
      { "󰈚  Recent Files", "leader f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "leader f w", "Telescope live_grep" },
      { "  Bookmarks", "leader m a", "Telescope marks" },
      { "  Themes", "leader t h", "Telescope themes" },
      { "  Mappings", "leader c h", "NvCheatsheet" },
    },
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  statusline = {
    theme = "default",
    separator_style = "block",
    order = nil,
    modules = nil,
  },

}

M.base46 = {

  theme = "everblush",
  transparency = false,
  -- theme_toggle = { "onedark", "one_light" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M
