--  See `:help vim.keymap.set()`
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode. See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>cd', vim.diagnostic.setloclist, { desc = 'Open [d]iagnostic quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Map <leader>t to open a terminal in the current window (overriding the buffer)
map('n', '<leader>t', '<cmd>terminal<CR>', { noremap = true, silent = true, desc = 'Terminal' })

-- TIP: Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Keybinds to make split navigation easier. See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })

------------ WINDOW ---
map('n', '<leader>-', '<cmd>sp<cr>', { desc = 'Split Window Horizontal' })
map('n', '<leader>|', '<cmd>vsp<cr>', { desc = 'Split Window Vertical' })

------------ BUFFERS ---
-- Map <Tab> to go to the next buffer
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })

-- Map <Shift-Tab> to go to the previous buffer
map('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })

-- Map <leader>bd to close the current buffer
map('n', '<leader>bd', '<cmd>bdelete<CR>', { noremap = true, silent = true, desc = 'buffer [d]elete' })

-- Map <leader>ba to close all buffers except the current one
map('n', '<leader>ba', '<cmd>bufdo bdelete<CR>', { noremap = true, silent = true, desc = 'buffer delete [a]ll' })
