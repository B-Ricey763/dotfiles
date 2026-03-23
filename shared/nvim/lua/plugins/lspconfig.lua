return {
	{ "mason-org/mason.nvim", opts = {} },
	{ "mason-org/mason-lspconfig.nvim", opts = {} },
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client == nil then
					return
				end
				if client.name == "ruff" then
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
				end

				-- Idk wtf this is but it exists lol, good for organize/sort imports in ts
				if client.name == "ts_ls" then
					vim.keymap.set(
						"n",
						"<leader>ct",
						"<cmd>LspTypescriptSourceAction<CR>",
						{ desc = "Typescript Source Actions" }
					)
				end
			end,
			desc = "LSP: Disable hover capability from Ruff",
		})
	end,
}
