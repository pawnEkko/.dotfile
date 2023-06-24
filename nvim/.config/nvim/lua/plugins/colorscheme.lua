-- 主题设置
return {
	--------------使用lazyvim管理主题----------
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin", --修改主题
		},
	},

	---------------------主题----------------
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},

	-- OneDark
	{
		"olimorris/onedarkpro.nvim",
		--onedark  onelight  onedark_vivid   onedark_dark 四色可选
		lazy = true,
	},

	-- gruvbox
	{
		"morhetz/gruvbox",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			integrations = {
				alpha = true,
				cmp = true,
				gitsigns = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true },
				neotest = true,
				noice = true,
				notify = true,
				nvimtree = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
	},
}
