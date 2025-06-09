return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		config = function()
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"html",
					"typescript",
					"javascript",
					"c",
					"tsx",
					"java",
					"rust",
					"python",
					"json",
					"yaml",
					"go",
					"svelte",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	-- {
	--   'nvim-treesitter/nvim-treesitter-context',
	--   dependencies = 'nvim-treesitter/nvim-treesitter',
	--   event = 'VeryLazy',
	--   opts = {},
	-- },
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
