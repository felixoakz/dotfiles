return {
	-- Highlight todo, notes, etc in comments (see `:help todo-comments.nvim`)
	{
		'folke/todo-comments.nvim',
		event = 'BufReadPost',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},
		opts = {
			signs = false,
		},
		config = function(_, opts)
			require('todo-comments').setup(opts)
			vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'TODO comments' })
			vim.keymap.set('n', '<leader>xt', '<cmd>TodoTrouble<cr>', { desc = 'Todo (Trouble)' })
		end,
	},
}
