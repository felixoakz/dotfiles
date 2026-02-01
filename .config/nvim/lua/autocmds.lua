-- See `:help lua-guide-autocommands`

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanked text',
	group = vim.api.nvim_create_augroup('user_yank_highlight', { clear = true }),
	callback = function()
		vim.highlight.on_yank { timeout = 200 }
	end,
})
