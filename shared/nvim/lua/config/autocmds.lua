local autocmds = {}

function autocmds.setup()
  -- Disable line numbers in terminal windows
  vim.api.nvim_create_autocmd('TermOpen', {
    desc = 'Disable line numbers in terminal windows',
    pattern = '*',
    callback = function()
      -- IMPORTANT: use local options, otherwise
      -- other bufferes will not have line numbers
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end,
  })

  -- On note files, like markdown or typst, I want
  -- to be able to navigate wrapped lines like normal, numbered
  -- lines, but in normal code it should be the same.
  -- FIXME: I should be able to use the 'FileType' autocmd but that doesn't work!
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    desc = 'Move by visible lines for notes',
    pattern = { '*.md', '*.typ' },
    callback = function()
      -- Set buffer only so you can edit code and markdown in the same session
      vim.keymap.set('n', 'j', 'gj', { buffer = true, noremap = true })
      vim.keymap.set('n', 'k', 'gk', { buffer = true, noremap = true })
      vim.keymap.set('n', '$', 'g$', { buffer = true, noremap = true })
      vim.keymap.set('n', '0', 'g0', { buffer = true, noremap = true })
      vim.keymap.set('n', '^', 'g^', { buffer = true, noremap = true })
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'typescript', 'typescriptreact' },
    callback = function()
      -- Map to copy word under cursor, insert console.log with it on next line, then save
      require('config.keymap').console_log()
    end,
    desc = 'Set up console.log keymap for TypeScript files',
  })
end

return autocmds
