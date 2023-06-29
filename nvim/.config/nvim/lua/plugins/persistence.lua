return {
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "恢复当前目录会话",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "恢复上次的会话",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "退出时不保存会话",
			},
		},
	},
}
