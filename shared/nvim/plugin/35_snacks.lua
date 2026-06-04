local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

later(function ()
  add({ "https://github.com/folke/snacks.nvim" })

  require("snacks").setup({
    lazygit = {},
  })
end)