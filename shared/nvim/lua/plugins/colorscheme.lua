return { 
	"catppuccin/nvim", 
	name = "catppuccin", 
	priority = 1000,
    opts = {
      integrations = { blink_cmp = true },
    },
    config = function(opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
}
