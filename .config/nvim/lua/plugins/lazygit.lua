return {

  {
    'kdheepak/lazygit.nvim',
    enabled = true,
    lazy = false,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    config = function()
    vim.keymap.set('n', '<leader>gl', function()
      vim.cmd('tabnew') -- Open in a new tab
      vim.cmd('term lazygit') -- Open LazyGit in terminal
    end, { noremap = true, silent = true, desc = 'git [l]azyGit' })
    end,
  },

}
