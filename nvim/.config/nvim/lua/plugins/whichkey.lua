return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader>bq"] = { name = "关闭当前buffer" },
				["<leader>b"] = { name = "Buffer(缓冲区操作)" },
				["<leader>bb"] = { name = "切换到其他的buffer" },
				["<leader>bc"] = { name = "选择一个buffer关闭" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
}
