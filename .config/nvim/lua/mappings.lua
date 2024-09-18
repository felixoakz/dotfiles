-- Load NVChad's default mappings
require("nvchad.mappings")


-- Define your custom mappings
local map = vim.keymap.set

-- Normal mode mapping for entering command mode
map("n", ";", ":", { desc = "CMD enter command mode" })

-- Insert mode mapping to exit to normal mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Leader key mapping for LazyGit
map("n", "<leader>l", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Save file mapping in normal, insert, and visual modes
-- map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
