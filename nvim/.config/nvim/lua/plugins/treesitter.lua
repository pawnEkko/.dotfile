return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"c_sharp",
					"css",
					"dart",
					"go",
					"html",
					"htmldjango",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"python",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"vue",
				},
				highlight = { enable = true },
				indent = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
			})
		end,
	},
}
