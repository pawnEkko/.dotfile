return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "p00f/nvim-ts-rainbow" },
		config = function()
			require("nvim-treesitter.configs").setup({
				-- 添加不同语言
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
				}, -- one of "all" or a list of languages

				highlight = { enable = true },
				indent = { enable = true },

				-- 不同括号颜色区分
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},
			})
		end,
	},
}
