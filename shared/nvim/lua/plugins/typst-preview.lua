return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	keys = {
		{ "<leader>T", "<cmd>TypstPreview<CR>", desc = "[T]ypst Preview" },
	},
	version = "1.*",
	opts = {
		open_cmd = "open -a Safari %s",
	}, -- lazy.nvim will implicitly calls `setup {}`
}
