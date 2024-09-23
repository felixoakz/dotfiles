-- Load NVChad's default mappings
require("nvchad.mappings")

-- Define your custom mappings
local map = vim.keymap.set

-- Disable mappings
local unmap = vim.keymap.del

local un_map = {
  { "<leader>/" },
  { "<leader>/", "v" },
  { "<leader>b" },
  { "<leader>x" },
  { "<leader>n" },
  { "<leader>th" },
  { "<leader>h" },
  { "<leader>v" },
  { "<leader>e" },
  { "<leader>ds" },
  { "<leader>ch" },
  { "<leader>cm" },
  { "<leader>fm" },
  { "<leader>ma" },
  { "<leader>rn" },
  { "<leader>pt" },
  { "<leader>fo" },
}

for _, mapping in ipairs(un_map) do
  local mode = mapping[2] or "n"
  unmap(mode, mapping[1])
end

---- REMAPS -----------------------------------------------------------------

--- TELESCOPE ---
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fl", "<cmd>Telescope oldfiles<CR>", { desc = "telescope latest files" })

-- GIT ---

map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "<leader>gm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })

-- BUFFER ---
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- LSP ---

map("n", "<leader>F", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format file" })

map("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- CONFS ---

map("n", "<leader>R", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

map("n", "<leader>?", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

map("n", "<leader>X", "<cmd>qa<cr>", { desc = "Exit All" })

-- WINDOW ---
map("n", "<leader>-", "<cmd>sp<cr>", { desc = "Split Window Horizontal" })
map("n", "<leader>|", "<cmd>vsp<cr>", { desc = "Split Window Vertical" })

-- UI ---
map("n", "<leader>t", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
