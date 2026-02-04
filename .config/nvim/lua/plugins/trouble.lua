return {
	-- Trouble: A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cmd = 'Trouble',
		opts = {
			focus = true,
		},
		keys = {
			{
				'<leader>tT',
				'<cmd>Trouble diagnostics toggle<cr>',
				desc = 'Diagnostics (Trouble)',
			},
			{
				'<leader>tt',
				'<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
				desc = 'Buffer Diagnostics (Trouble)',
			},
			{
				'<leader>ts',
				'<cmd>Trouble symbols toggle focus=false<cr>',
				desc = 'Symbols (Trouble)',
			},
			{
				'<leader>tr',
				'<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
				desc = 'LSP Definitions / references / ... (Trouble)',
			},
			{
				'<leader>tl',
				'<cmd>Trouble loclist toggle<cr>',
				desc = 'Location List (Trouble)',
			},
			{
				'<leader>tq',
				'<cmd>Trouble qflist toggle<cr>',
				desc = 'Quickfix List (Trouble)',
			},
		},
	},
}
