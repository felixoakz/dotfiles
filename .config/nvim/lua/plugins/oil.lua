return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      vim.keymap.set('n', '-', require('oil').open, { desc = 'Open Oil File Explorer' }),
      default_file_explorer = true,
      columns = { 'icon' },
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      prompt_save_on_select_new_entry = true,
      cleanup_delay_ms = 2000,
      lsp_file_methods = {
        enabled = true,
        timeout_ms = 1000,
        autosave_changes = false,
      },
      constrain_cursor = 'editable',
      watch_for_changes = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' } },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      use_default_keymaps = true,
      view_options = {
        show_hidden = false,
        natural_order = true,
        case_insensitive = false,
        sort = {
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
      git = {
        add = function()
          return false
        end,
        mv = function()
          return false
        end,
        rm = function()
          return false
        end,
      },
      float = {
        padding = 2,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
      },
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        max_height = 0.9,
        min_height = { 5, 0.1 },
        border = 'rounded',
        update_on_cursor_moved = true,
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        border = 'rounded',
        minimized_border = 'none',
      },
      ssh = { border = 'rounded' },
      keymaps_help = { border = 'rounded' },
    }
  end,
}
