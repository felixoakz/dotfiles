return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
      views = {
        cmdline_popup = {
          position = {
            row = -3,
            -- col = -1,
          },
        },
      },
      lsp = {
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
