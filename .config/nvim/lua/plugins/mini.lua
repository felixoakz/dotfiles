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

      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
