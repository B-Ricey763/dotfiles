return {
	"folke/todo-comments.nvim",
	event = { "BufRead", "BufNewFile" },
	opts = {},
	keys = {
		{
			"<leader>st",
			function()
				require("snacks").picker.todo_comments()
			end,
		},
	},
}
