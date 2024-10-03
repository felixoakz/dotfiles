return {

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Configure Mini Starter (dashboard)
      require('mini.starter').setup {

        -- Set header (can be ASCII art or a simple text)
        -- header = table.concat({
        --   -- ascii
        -- }, '\n'),

        -- Define content sections
        -- items = {
        --   { name = 'Recent files', action = 'Telescope oldfiles', section = 'Actions' },
        --   { name = 'New file', action = 'ene | startinsert', section = 'Actions' },
        --   { name = 'Find file', action = 'Telescope find_files', section = 'Actions' },
        --   { name = 'Quit', action = 'qa', section = 'Misc' },
        -- },

        -- Custom footer
        footer = function()
          return table.concat({
            [[▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄]],
            [[██ ▀██ ██ ▄▄▄██ ▄▄▄ ██ ███ █▄ ▄██ ▄▀▄ ██]],
            [[██ █ █ ██ ▄▄▄██ ███ ███ █ ███ ███ █ █ ██]],
            [[██ ██▄ ██ ▀▀▀██ ▀▀▀ ███▄▀▄██▀ ▀██ ███ ██]],
            [[▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀]],
          }, '\n')
        end,

        -- Center everything in the middle
        content_hooks = {
          require('mini.starter').gen_hook.adding_bullet '» ',
          require('mini.starter').gen_hook.aligning('center', 'center'),
        },
      }

      local statusline = require 'mini.statusline'

      statusline.setup {
        use_icons = vim.g.have_nerd_font
      }

      statusline.section_location = function()
        return '%2l:%-2v'
      end

    end,
  },
}
