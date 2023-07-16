return {
	{ "christoomey/vim-tmux-navigator" },
	-- filetype
	{
		"nathom/filetype.nvim",
		lazy = true,
		event = "User FileOpened",
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						-- 在此处规定后缀识别为什么文件
						h = "cpp",
					},
				},
			})
		end,
	},
	-- lastplace
	{
		"ethanholz/nvim-lastplace",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
}
