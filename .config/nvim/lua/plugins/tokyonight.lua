return {
	-- TokyoNight colorscheme (see `:help tokyonight.nvim`)
	{
		'folke/tokyonight.nvim',
		priority = 1000, -- Load theme first
		config = function()
			require('tokyonight').setup {
				style = 'night',
				transparent = true,
				styles = {
					sidebars = 'transparent',
					floats = 'transparent',
				},
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors) end,
			}
			vim.cmd.colorscheme 'tokyonight-night'
		end,
	},
}
