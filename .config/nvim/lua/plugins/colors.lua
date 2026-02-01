-- In your plugins configuration file (e.g., 'lua/plugins/init.lua')
return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end,
}
