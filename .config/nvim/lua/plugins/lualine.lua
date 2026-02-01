-- lua/plugins/lualine.lua
-- Close replica of LazyVim's lualine layout (safe, minimal, and compatible)
return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' }, -- recommended for icons + lsp progress
    opts = function()
      return {
        options = {
          theme = 'tokyonight',
          globalstatus = false,             -- use per-window statusline
          section_separators = { left = '', right = '' },
          component_separators = { left = '│', right = '│' },
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } }, require('lualine.components.lsp_progress').progress },
          lualine_c = { { 'filename', path = 1 } }, -- show relative path
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'neo-tree', 'quickfix', 'fzf' }, -- harmless, optional
      }
    end,
  },
}
