-- 主题设置
return {
	--------------使用lazyvim管理主题----------
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight", --修改主题
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
}
