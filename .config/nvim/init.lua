-- Set leader key to space
-- This must be done before plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- Add nvim site directory to runtimepath (required for treesitter parsers)
vim.opt.runtimepath:prepend(vim.fn.stdpath('data') .. '/site')

-- Load core modules
require 'options'
require 'mappings'
require 'autocmds'

-- Install lazy.nvim package manager
-- See: https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- NOTE: To fix plugin corruption, remove the plugin's folder from ~/.local/share/nvim/lazy/.
--       On reinitialization, Neovim will just install a fresh copy.

-- Configure and install plugins
require('lazy').setup({
	{ import = 'plugins' },
}, {
	ui = {
		-- Use Nerd Font icons if available, otherwise use unicode.
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '🛠',
			event = '📅',
			ft = '📂',
			init = '⚙',
			keys = '🗝',
			plugin = '🔌',
			runtime = '💻',
			require = '🌙',
			source = '📄',
			start = '🚀',
			task = '📌',
			lazy = '💤 ',
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
