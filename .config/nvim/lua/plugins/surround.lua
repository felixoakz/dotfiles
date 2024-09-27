return {
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
-- ys + iw + ' = insert surround around word '
-- ds + ' = delete surround '
-- cs + ' + " = change ' to "

-- dst for tag
