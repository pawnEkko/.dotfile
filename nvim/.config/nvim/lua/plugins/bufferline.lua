return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function()
			require("bufferline").setup({
				options = {
					-- 使用 nvim 内置lsp
					always_show_bufferline = false,
					diagnostics = "nvim_lsp",
					-- 左侧让出 nvim-tree 的位置
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})
		end,
	},
}
