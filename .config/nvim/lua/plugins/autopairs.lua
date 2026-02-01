return {
	-- Autopairs for brackets, quotes, etc. (see `:help nvim-autopairs`)
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		dependencies = { 'hrsh7th/nvim-cmp' },
		opts = {},

		config = function(_, opts)
			require('nvim-autopairs').setup(opts)
			-- Add `(` after selecting a function or method from cmp
			local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
			local cmp = require 'cmp'
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},

	-- Autotag for HTML, XML, etc.
	{
		'windwp/nvim-ts-autotag',
		event = 'InsertEnter',
		opts = {},
	},
}

