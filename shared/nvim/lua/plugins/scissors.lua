-- Used to dynamically add snippets on the fly
return {
  'chrisgrieser/nvim-scissors',
  dependencies = 'folke/snacks.nvim',
  opts = {
    snippetDir = vim.fn.stdpath 'config' .. '/snippets',
  },
}
