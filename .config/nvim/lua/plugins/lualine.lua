-- lua/plugins/lualine.lua
return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    opts = function()
      local colors = {
        yellow = '#eab308',
        grey = '#787c99',
        darkgrey = '#414868',
        bg = '#1a1b26', -- TokyoNight Night background color
      }

      -- Tidy: Simplified theme generation
      local function section(fg, gui)
        return { fg = fg, bg = colors.bg, gui = gui }
      end

      local custom_theme = {
        normal = {
          a = section(colors.yellow, 'bold'),
          b = section(colors.grey),
          c = section(colors.grey),
          x = section(colors.grey),
          y = section(colors.grey),
          z = section(colors.yellow, 'bold'),
        },
        inactive = {
          a = section(colors.darkgrey),
          b = section(colors.darkgrey),
          c = section(colors.darkgrey),
          x = section(colors.darkgrey),
          y = section(colors.darkgrey),
          z = section(colors.darkgrey),
        },
      }
      -- Duplicate normal theme for other modes to keep UI consistent
      custom_theme.insert = custom_theme.normal
      custom_theme.visual = custom_theme.normal
      custom_theme.replace = custom_theme.normal
      custom_theme.command = custom_theme.normal

      local function os_icon()
        local icons = { Darwin = '', Linux = '', Windows_NT = '' }
        return icons[vim.loop.os_uname().sysname] or '󰟀'
      end

      return {
        options = {
          theme = custom_theme,
          globalstatus = false,
          component_separators = '',
          section_separators = '',
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
        },
        sections = {
          lualine_a = { { 'mode', fmt = function(str) return ' ' .. str .. ' ' end } },
          lualine_b = {
            { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌶 ' } },
            { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
          },
          lualine_c = {
            { function() return '' end, color = { fg = colors.yellow }, padding = { left = 1, right = 0 } },
            { 'filename', path = 1, symbols = { modified = ' ●', readonly = ' 󰌾', unnamed = '[No Name]', newfile = '[New]' }, color = { fg = colors.grey, gui = 'bold' } },
            { function() return vim.b.term_title or '' end, cond = function() return vim.bo.buftype == 'terminal' end, color = { fg = colors.grey } },
          },
          lualine_x = {
            { function() return require('lualine.components.lsp_progress').progress() end, color = { fg = colors.grey } },
          },
          lualine_y = {
            { 'encoding', color = { fg = colors.grey } },
            { os_icon, color = { fg = colors.grey } },
            { 'filetype', icon_only = false, color = { fg = colors.grey } },
            { 'progress', color = { fg = colors.grey } },
          },
          lualine_z = { { 'location', color = { fg = colors.yellow, gui = 'bold' } } },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1, color = { fg = colors.darkgrey } } },
          lualine_x = { { 'location', color = { fg = colors.darkgrey } } },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'neo-tree', 'lazy', 'fzf' },
      }
    end,
  },
}
