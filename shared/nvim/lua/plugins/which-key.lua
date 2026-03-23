return {
  'folke/which-key.nvim',
  dependencies = {
    'echasnovski/mini.icons',
  },
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    spec = {
      { '<leader>b', group = 'Buffers' },
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Debug' },
      { '<leader>f', group = 'Find' },
      { '<leader>s', group = 'Search' },
      { '<leader>u', group = 'UI' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>w', proxy = '<c-w>', group = 'windows' },
    },
  },
}
