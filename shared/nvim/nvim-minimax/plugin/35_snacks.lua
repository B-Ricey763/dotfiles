local add, later = MiniDeps.add, MiniDeps.later
local now_if_args = Config.now_if_args

later(function ()
  add({
    source = "folke/snacks.nvim",
  })

  require("snacks").setup({
    lazygit = {},
    picker = {},
  })
end)
