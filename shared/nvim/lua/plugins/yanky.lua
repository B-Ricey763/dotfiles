return {
  'gbprod/yanky.nvim',
  event = 'VeryLazy',
  config = function()
    require('yanky').setup()

    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = 'Yanky [P]ut after' })
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = 'Yanky [P]ut before' })
    vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { desc = 'Yanky [GP]ut after' })
    vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { desc = 'Yanky [GP]ut before' })
    vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)', { desc = 'Yanky cycle prev entry' })
    vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)', { desc = 'Yanky cycle next entry' })
  end,
}
