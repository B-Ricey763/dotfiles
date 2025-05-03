return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = false,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'biome' },
      typescript = { 'biome' },
      typescriptreact = { 'biome' },
      javascriptreact = { 'biome' },
      json = { 'biome' },
      sh = { 'shfmt' },
      c = { 'clang-format' },
      python = { 'black' },
      markdown = { 'mdformat' },
    },
  },
}
