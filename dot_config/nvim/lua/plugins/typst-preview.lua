return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  keys = {
    { '<leader>T', '<cmd>TypstPreview<CR>', desc = '[T]ypst Preview' },
  },
  version = '1.*',
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
}
