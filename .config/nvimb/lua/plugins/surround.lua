return {
  { "echasnovski/mini.surround", enabled = false },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  -- ys + motion -> to insert: ys iw to select word
  -- ds " -> to delete double quote
  -- cs " -> to change double quote
}
