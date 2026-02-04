return {
	-- Show pending keybinds (see `:help which-key.nvim`)
	{
		'folke/which-key.nvim',
		event = 'VeryLazy', -- Load on VeryLazy for better performance
		opts = {
			preset = 'modern', -- Use the modern preset for a LazyVim-like look
			win = {
				border = 'single',
				-- position = 'right', -- Show as a column on the right side
				-- width = 0.3, -- Width of the window
			},
			icons = {
				mappings = vim.g.have_nerd_font, -- Use Nerd Font icons if available
			},
			spec = {
				{ '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
				{ '<leader>b', group = '[B]uffer' },
				{ '<leader>w', group = '[W]indow' },
				{ '<leader>s', group = '[S]earch' },
				{ '<leader>t', group = '[T]rouble' },
				{ '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
				{ '<leader>m', desc = 'Treesj Toggle' },
				{ ']', group = 'Next' },
				{ '[', group = 'Prev' },
				{ 'g', group = 'Go' },
			},
		},
	},
}
