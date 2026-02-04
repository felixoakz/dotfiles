-- See `:help vim.keymap.set()`
local map = vim.keymap.set

-- General
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })
map('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })

map('n', '<leader>P', function()
	vim.fn.setreg('+', vim.fn.fnamemodify(vim.fn.expand '%', ':~:.'))
end, { desc = 'Copy relative path' })

-- Diagnostics
map('n', '<leader>d', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice message' })

-- Window Navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to upper window' })

-- Window Management
map('n', '<leader>wh', '<cmd>split<cr>', { desc = 'Split horizontal' })
map('n', '<leader>wv', '<cmd>vsplit<cr>', { desc = 'Split vertical' })
map('n', '<leader>wc', '<cmd>close<CR>', { desc = 'Close window' })

-- Buffer Management
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', '<leader>bd', '<cmd>bdelete<CR>', { silent = true, desc = 'Delete buffer' })

map('n', '<leader>ba', function()
	local current_buf = vim.api.nvim_get_current_buf()
	local bufs = vim.api.nvim_list_bufs()
	for _, buf in ipairs(bufs) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			vim.cmd('bdelete! ' .. buf)
		end
	end
end, { silent = true, desc = 'Delete all other buffers' })

map('n', '<leader>bn', '<cmd>enew<CR>', { silent = true, desc = 'New buffer' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '|', function()
	vim.ui.input({ prompt = 'Terminal Name: ' }, function(input)
		vim.cmd 'vsplit | terminal'
		if input and #input > 0 then
			vim.api.nvim_buf_set_name(0, 'term://' .. input)
		end
	end)
end, { desc = 'Open named vertical terminal' })

map('n', '_', function()
	vim.ui.input({ prompt = 'Terminal Name: ' }, function(input)
		vim.cmd 'split | terminal'
		if input and #input > 0 then
			vim.api.nvim_buf_set_name(0, 'term://' .. input)
		end
	end)
end, { desc = 'Open named horizontal terminal' })

map('n', '+', function()
	vim.ui.input({ prompt = 'Terminal Name: ' }, function(input)
		vim.cmd 'terminal'
		if input and #input > 0 then
			vim.api.nvim_buf_set_name(0, 'term://' .. input)
		end
	end)
end, { desc = 'Open named terminal' })

map('n', '<leader>br', function()
	vim.ui.input({ prompt = 'New Buffer Name: ' }, function(input)
		if input and #input > 0 then
			if vim.bo.buftype == 'terminal' then
				vim.api.nvim_buf_set_name(0, 'term://' .. input)
			else
				vim.api.nvim_buf_set_name(0, input)
			end
		end
	end)
end, { desc = 'Rename buffer/terminal' })
