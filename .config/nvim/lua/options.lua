-- For more options, see `:help option-list`

-- UI
vim.opt.termguicolors = true -- Required for colorschemes like tokyonight to work properly
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.showmode = false -- Don't show mode, it's in status line
vim.opt.signcolumn = 'yes' -- Always show the sign column
vim.opt.cursorline = true -- Highlight the current line
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor
vim.opt.colorcolumn = '80' -- Line marker at 80 columns
vim.opt.splitright = true -- Open new vertical splits to the right
vim.opt.splitbelow = true -- Open new horizontal splits below
vim.opt.laststatus = 2 -- Always show statusline (per window)
vim.opt.pumheight = 10 -- Set popup menu height

-- Folding
-- The foldmethod is now set in the treesitter plugin configuration.

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false -- Use tabs
vim.opt.breakindent = true -- Enable break indent

-- Search
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- But case-sensitive if capital letters are used

-- Performance & Behavior
vim.opt.undofile = true -- Save undo history
vim.opt.updatetime = 250 -- Faster update time
vim.opt.timeoutlen = 300 -- Shorter mapped sequence wait time
vim.opt.inccommand = 'split' -- Preview substitutions live

-- Clipboard
-- Sync with system clipboard.
vim.opt.clipboard = 'unnamedplus'

-- Whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }
