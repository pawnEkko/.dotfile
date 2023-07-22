return {
	{
		"ellisonleao/glow.nvim",
		config = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		cmd = {
			"MarkdownPreview",
			"MarkdownPreviewStop",
			"MarkdownPreviewToggle",
		},
		event = "BufRead",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{ "<leader>mm", "<cmd>MarkdownPreview<cr>", desc = "预览MarkDown" },
		},
	},
}
