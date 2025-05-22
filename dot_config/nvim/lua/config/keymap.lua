local keymap = {}

function keymap.setup()
  -- Get rid of highlight on escape, otherwise
  -- you would have to run :nohlsearch every time to remove
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show [d]iagnostic' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  vim.keymap.set('i', '<C-f>', '<right>', { desc = 'Move right one character' })
  vim.keymap.set('i', '<C-b>', '<left>', { desc = 'Move right one character' })

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  -- LSP mapping
  vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
  end, { desc = '[C]ode [A]ction' })

  vim.keymap.set('n', '<leader>cr', function()
    vim.lsp.buf.rename()
  end, { desc = '[R]ename' })
end

-- setup via autcmd
function keymap.console_log()
  vim.api.nvim_buf_set_keymap(
    0,
    'n',
    '<leader>cl',
    'yiwoconsole.log(<C-r>")<Esc>:w<CR>',
    { noremap = true, silent = true, desc = '[C]onsole [L]og current variable' }
  )
end

return keymap
