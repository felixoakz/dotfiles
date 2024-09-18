return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local conf = require('telescope.config').values
    opts.defaults = opts.defaults or {}
    opts.defaults.vimgrep_arguments = opts.defaults.vimgrep_arguments or conf.vimgrep_arguments
    table.insert(opts.defaults.vimgrep_arguments, '--fixed-strings')
  end,
}
