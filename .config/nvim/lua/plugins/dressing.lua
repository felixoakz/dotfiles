return {
	-- Better UI for vim.ui.select and vim.ui.input
	{
		'stevearc/dressing.nvim',
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require('lazy').load { plugins = { 'dressing.nvim' } }
				return vim.ui.input(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require('lazy').load { plugins = { 'dressing.nvim' } }
				return vim.ui.select(...)
			end
		end,
	},
}
