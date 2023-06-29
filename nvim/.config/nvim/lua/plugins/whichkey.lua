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
				["<leader>b"] = { name = "Buffer(缓冲区操作)" },
				["<leader>d"] = { name = "+debug" },
				["<leader>f"] = { name = "Explore File" },
				["<leader>m"] = { name = "Reverso Context" },
				["<leader>q"] = { name = "自动会话管理" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
}
