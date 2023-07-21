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
	-- barbecue
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			{
				"SmiteshP/nvim-navic",
				lazy = true,
				init = function()
					vim.g.navic_silence = true
					require("util").on_attach(function(client, buffer)
						if client.server_capabilities.documentSymbolProvider then
							require("nvim-navic").attach(client, buffer)
						end
					end)
				end,
				opts = function()
					return {
						separator = " ",
						highlight = true,
						depth_limit = 5,
						icons = require("config").icons.kinds,
					}
				end,
			},
		},
		config = function()
			require("barbecue").setup({
				theme = "auto",
			})
		end,
	},
}
