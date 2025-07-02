return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	dependencies = {
		-- Used for different comment syntax in stuff like tsx, jsx, svelte, etc.
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	version = false,
	event = "VeryLazy",
	config = function()
		-- No configured modules
		require("mini.icons").setup()
		require("mini.comment").setup()
		require("mini.files").setup({
			options = { use_as_default_explorer = false },
		})
		-- Mini trailspace could be enabled, but that screws up the dashboard in mini.snack

		local ai = require("mini.ai")
		local gen_ai_spec = require("mini.extra").gen_ai_spec
		require("mini.ai").setup({
			n_lines = 500,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({ -- code block
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}),
				-- these are defined in nvim treesitter file 'textobjects.scm'
				-- also see https://github.com/mawkler/jsx-element.nvim/tree/main
				-- these lowkey don't work
				t = ai.gen_spec.treesitter({
					a = "@jsx_element.outer",
					i = "@jsx_element.inner",
				}),
				-- These seem to be a bit buggy, but by god I am NOT learning treesitter queries
				T = ai.gen_spec.treesitter({
					a = "@jsx_self_closing_element.outer",
					i = "@jsx_self_closing_element.inner",
				}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
				g = gen_ai_spec.buffer(), -- buffer
				u = ai.gen_spec.function_call(), -- u for "Usage"
				U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
			},
		})

		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		})

		local gen_loader = require("mini.snippets").gen_loader
		require("mini.snippets").setup({
			snippets = {
				-- Load custom file with global snippets first (adjust for Windows)
				gen_loader.from_file("~/.config/nvim/snippets/global.json"),

				-- Load snippets based on current language by reading files from
				-- "snippets/" subdirectories from 'runtimepath' directories.
				gen_loader.from_lang(),
			},
		})

		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		require("mini.misc").setup()
		MiniMisc.setup_auto_root()

		-- Setup mini files autocmd
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesActionRename",
			callback = function(event)
				Snacks.rename.on_rename_file(event.data.from, event.data.to)
			end,
		})
	end,
	keys = {
		{
			"<leader>F",
			function()
				-- SUPER USEFUL so I'm able to open mini.files in the current working directory
				MiniFiles.open(vim.api.nvim_buf_get_name(0), false)

				MiniFiles.reveal_cwd()
			end,
			desc = "Open MiniFiles",
		},
	},
}
