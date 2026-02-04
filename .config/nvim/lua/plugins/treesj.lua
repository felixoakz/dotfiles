return {
  'Wansmer/treesj',
  keys = {
    { '<leader>m', '<cmd>TSJToggle<cr>', desc = 'Join/Split toggle' },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
    })
  end,
}
