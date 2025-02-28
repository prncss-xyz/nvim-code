return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"bash",
				"css",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"tsx",
				"typescript",
				"yaml",
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
