return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			-- This should make nvim more portable, the stuff that I need should install by default
			-- TODO: maybe make this package manager specific? Idk mason might be good enough
			ensure_installed = {
				"svelte-language-server",
				"ruff",
				"clang-format",
				"yaml-language-server",
				"tailwindcss-language-server",
				"pyright",
				"basedpyright",
				"rust-analyzer",
				"stylua",
				"bash-language-server",
				"dockerfile-language-server",
				"lua-language-server",
				"deno",
				"harper-ls",
				"biome",
				"black",
				"clangd",
				"codelldb",
				"jdtls",
				"json-lsp",
				"mdformat",
				"shellcheck",
				"shfmt",
				"tinymist",
				"typescript-language-server",
				"yamlfmt",
				"markdownlint",
			},
		},
	},
}
