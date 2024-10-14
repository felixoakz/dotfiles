return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>yy',
        '<cmd>Yazi<cr>',
        desc = 'current file',
      },
      {
        -- Open in the current working directory
        '<leader>yr',
        '<cmd>Yazi cwd<cr>',
        desc = "project root dir",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<leader>yt',
        '<cmd>Yazi toggle<cr>',
        desc = 'toggle session',
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
}
