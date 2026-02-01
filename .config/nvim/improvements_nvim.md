# Neovim Configuration Improvements

> This document tracks potential improvements and additions to the Neovim configuration.
> Last updated: February 2026

---

## Current Configuration Overview

**Active Tech Stack:**
- Lua (Neovim config)
- Python (Django/Flask)
- PHP (Laravel)
- TypeScript/JavaScript (React, React Native)
- Go
- HTML/CSS/Tailwind

**Plugin Manager:** lazy.nvim

---

## High Priority Improvements

### 1. Debugging (DAP - Debug Adapter Protocol)
**Plugins:** `nvim-dap`, `nvim-dap-ui`, language-specific DAP adapters

**Why:** Currently no debugging support. Essential for troubleshooting issues in Python, Go, and JavaScript applications.

**What it does:**
- Set breakpoints with visual indicators
- Step through code (step in/over/out)
- Inspect variables and watch expressions
- View call stack and threads
- Debug configurations per project

**Languages to configure:**
- Python (`debugpy`)
- Go (`delve`)
- JavaScript/TypeScript (`js-debug-adapter` or `vscode-js-debug`)
- PHP (optional: `php-debug`)

**Estimated effort:** Medium

---

### 2. Better Diagnostics UI (Trouble.nvim)
**Plugin:** `folke/trouble.nvim`

**Why:** Current diagnostics are basic. Trouble provides a beautiful, organized panel for errors, warnings, TODOs, and LSP references.

**What it does:**
- Pretty list of diagnostics, references, telescope results
- Quick navigation between issues
- Filter by severity (errors only, warnings, etc.)
- Works with Telescope for better search results
- Better LSP code actions UI

**Key features:**
- `<leader>xx` - Toggle diagnostics
- `<leader>xX` - Buffer diagnostics only
- `<leader>cs` - Symbols list
- `<leader>cl` - LSP references/definitions

**Estimated effort:** Low

---

### 3. Testing Framework (Neotest)
**Plugin:** `nvim-neotest/neotest` + language adapters

**Why:** No test runner integration. Run and view test results directly in Neovim without leaving the editor.

**What it does:**
- Run tests with `<leader>tt` (nearest test) or `<leader>tT` (file)
- See pass/fail status in the sign column
- Interactive test output panel
- Debug failed tests directly
- Watch mode for test-driven development

**Adapters needed:**
- Python (`neotest-python` for pytest/unittest)
- Go (`neotest-go`)
- JavaScript/TypeScript (`neotest-jest` or `neotest-vitest`)

**Estimated effort:** Medium

---

## Medium Priority Improvements

### 4. Quick File Navigation (Harpoon)
**Plugin:** `ThePrimeagen/harpoon`

**Why:** Switching between frequently accessed files in a project is cumbersome. Harpoon provides project-local file marks.

**What it does:**
- Mark up to 4 files per project with `<leader>a` (add) and `<leader>1-4` (jump)
- Files persist per project (based on git root)
- Quick menu to view/edit marks with `<leader>h`
- Much faster than Telescope for files you access repeatedly

**Perfect for:**
- Switching between controller/model/test in Laravel
- Toggling between component and styles in React
- Jumping between main files in Go projects

**Estimated effort:** Low

---

### 5. Project-wide Search & Replace (Spectre)
**Plugin:** `nvim-pack/nvim-spectre`

**Why:** No built-in way to search and replace across multiple files with preview.

**What it does:**
- Search and replace across entire project
- Live preview of changes before applying
- Regex support
- Integration with current word/selection
- Undo changes if needed

**Keymaps:**
- `<leader>S` - Open Spectre
- `<leader>sw` - Search current word

**Estimated effort:** Low

---

### 6. Session Management
**Plugin:** `folke/persistence.nvim` or `rmagatti/auto-session`

**Why:** Lose your workspace (open buffers, windows, tabs) when you close Neovim. Sessions restore your exact workspace per project.

**What it does:**
- Auto-save session when quitting
- Auto-restore session when opening a project
- Manual save/restore commands
- Sessions stored per git repository

**Why persistence.nvim:**
- Lightweight, simple, reliable
- Works with tmux/resurrect

**Why auto-session:**
- More automatic, less manual intervention
- Better directory change detection

**Estimated effort:** Low

---

### 7. Code Navigation Breadcrumbs (Navic)
**Plugin:** `SmiteshP/nvim-navic` (winbar) + `SmiteshP/nvim-navbuddy` (popup)

**Why:** Hard to see current context (class > method > block) when deep in code.

**What it does:**
- Show breadcrumb trail in winbar (top of window)
- Display: File > Class > Function > Block
- Click/jump to any level
- Navbuddy: Interactive popup for exploring symbols

**Estimated effort:** Low

---

### 8. Visual Undo History (Undotree)
**Plugin:** `mbbill/undotree` or `debugloop/telescope-undo.nvim`

**Why:** Vim's undo is powerful but invisible. See your edit history visually.

**What it does:**
- Visual tree of undo history
- Jump to any previous state
- See diffs between states
- Branches for undo (yes, undo has branches!)

**Keymaps:**
- `<leader>u` - Toggle undotree

**Estimated effort:** Low

---

### 9. REST Client (for API Testing)
**Plugin:** `rest-nvim/rest.nvim` + `nvim-treesitter-http`

**Why:** Testing APIs requires leaving Neovim or using external tools.

**What it does:**
- Write HTTP requests in `.http` files
- Send requests and view responses in Neovim
- Syntax highlighting for HTTP files
- Environment variables support
- JSON response formatting

**Useful for:**
- Testing Laravel APIs
- Debugging Python FastAPI endpoints
- Go API development

**Estimated effort:** Medium (requires treesitter parser)

---

## Low Priority (Polish & QOL)

### 10. Format on Save Toggle
**Current state:** Format on save is disabled globally

**Improvement:** Add toggle or per-project configuration

**Options:**
- Auto-format on save for specific filetypes only
- Per-project `.nvim.lua` config
- Keymap to toggle format-on-save: `<leader>uf`

**Why:** Sometimes you want to save without formatting (legacy code, team preferences)

**Estimated effort:** Low

---

### 11. Inline Git Blame
**Plugin enhancement:** Enable in gitsigns.nvim

**Current:** Git blame requires manual `<leader>gb` command

**Improvement:** Show blame on current line (virtual text)

**What it does:**
- Show "Author, 3 days ago • message" at end of current line
- Configurable delay
- Toggle with `<leader>gB`

**Code to add to gitsigns config:**
```lua
current_line_blame = true,
current_line_blame_opts = {
  delay = 500,
  virt_text_pos = 'eol',
}
```

**Estimated effort:** Very Low

---

### 12. LSP Hover/Signature Borders
**Current:** LSP hover and signature help have no borders

**Improvement:** Add borders for consistency with completion menu

**What to configure:**
- `vim.lsp.handlers["textDocument/hover"]`
- `vim.lsp.handlers["textDocument/signatureHelp"]`

**Why:** Visual consistency, better readability

**Estimated effort:** Very Low

---

### 13. Better Input UI (Dressing)
**Plugin:** `stevearc/dressing.nvim`

**Why:** Default `vim.ui.input` and `vim.ui.select` are basic. Dressing makes them pretty.

**What it does:**
- Better input prompts (Telescope-style)
- Better selection UI
- Consistent with Telescope theme
- Supports code actions picker

**Estimated effort:** Low

---

### 14. LSP Signature Window Trigger
**Current:** Signature help only shows when typing

**Improvement:** Add keymap to manually trigger signature help

**Keymap suggestion:**
- `<leader>cs` - Show signature help

**Why:** Useful when you want to see function signature without typing

**Estimated effort:** Very Low

---

### 15. Startup Time Profiling
**Plugin:** `dstein64/vim-startuptime` or lazy.nvim built-in profiling

**Why:** Understand what's slowing down Neovim startup

**What it does:**
- Profile startup time by plugin
- Identify slow-loading plugins
- Optimize lazy-loading

**Usage:**
- `:StartupTime` command
- Or `nvim --startuptime startup.log`

**Estimated effort:** Very Low

---

### 16. Code Actions Preview
**Plugin:** `aznhe21/actions-preview.nvim`

**Why:** Default code action menu is basic. See preview of changes before applying.

**What it does:**
- Telescope-style picker for code actions
- Preview changes in floating window
- Better UX for renaming, imports, fixes

**Replaces:** Default `<leader>ca` behavior

**Estimated effort:** Low

---

## Best Practices & Maintenance

### 17. README Documentation
**Create:** `README.md` in nvim directory

**Contents:**
- Setup instructions
- Keybinding reference table
- Plugin list with descriptions
- Troubleshooting guide
- Screenshots (optional)

**Why:** Documentation helps you remember keybindings and helps others who might use your config

**Estimated effort:** Medium

---

### 18. Lock File Version Control
**Current:** `.gitignore` ignores `lazy-lock.json`

**Consider:** Committing `lazy-lock.json` for reproducibility

**Why:**
- Ensures exact same plugin versions across machines
- Prevents breaking changes from plugin updates
- Easy rollback if update breaks something

**Trade-off:** Must run `:Lazy sync` after pulling changes

**Estimated effort:** Very Low

---

### 19. Health Checks
**Action:** Run `:checkhealth` periodically

**What to check:**
- All LSP servers installed correctly
- Treesitter parsers up to date
- No conflicting plugins
- External dependencies present

**Fix common issues:**
- Missing language servers
- Treesitter compilation errors
- Python/Node.js version compatibility

**Estimated effort:** Very Low

---

### 20. Snippet Expansion
**Current:** LuaSnip is basic

**Improvement:** Add custom snippets or more snippet sources

**Options:**
- `rafamadriz/friendly-snippets` (more languages)
- Custom snippets for Laravel, React, Go patterns
- Snippet history with `<C-j>`/`<C-k>` navigation

**Estimated effort:** Medium

---

## Recommended Implementation Order

If implementing gradually, here's the suggested priority:

1. **Week 1:** Trouble + Dressing + Inline Git Blame (Low effort, high impact)
2. **Week 2:** Harpoon + Spectre (Workflow improvements)
3. **Week 3:** Session Management + Undotree (State preservation)
4. **Week 4:** DAP setup (Debugging - requires more config)
5. **Week 5:** Neotest (Testing - pair with DAP for debugging tests)
6. **Week 6:** Navic + REST Client (Navigation + API testing)
7. **Ongoing:** README, lock file, health checks, polish items

---

## Resources

### Plugin Discovery
- [Dotfyle](https://dotfyle.com/) - Neovim plugin trends
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim) - Curated plugin list
- [LazyVim extras](https://www.lazyvim.org/extras) - See what LazyVim includes

### Documentation
- `:help lsp` - Built-in LSP docs
- `:help telescope` - Telescope docs
- Plugin READMEs on GitHub

### Community
- r/neovim subreddit
- Neovim Discourse
- GitHub Discussions on plugin repos

---

## Changelog

- **2026-02-01:** Initial improvements list created
- Removed C#/.NET support (omnisharp, csharpier)
- Added Go support (gopls, gofumpt, goimports-reviser)
