return {
	-- Surround text with parentheses, brackets, quotes, etc. (see `:help nvim-surround`)
	{
		'kylechui/nvim-surround',
		version = '*', -- Use for stability
		event = { 'BufReadPre', 'BufNewFile' },
		config = function()
			require('nvim-surround').setup {}
		end,
	},
}

