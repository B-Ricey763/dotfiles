local lsp = {}

function lsp.setup()
	-- Configure language server settings
	vim.lsp.config("basedpyright", {
		settings = {
			basedpyright = {
				analysis = {
					typeCheckingMode = "standard",
				},
			},
		},
	})
end

return lsp
