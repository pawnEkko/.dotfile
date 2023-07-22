local Util = require("util")
return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
		cmd = "Telescope",
		version = false,
		keys = {
			{ "<leader>fg", Util.telescope("live_grep"), desc = "按字符查找(root dir)" },
			{ "<leader><space>", Util.telescope("files"), desc = "查找文件(root dir)" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查找buffer" },
			{ "<leader>ff", Util.telescope("files"), desc = "查找文件 (root dir)" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "查找历史文件" },
			{ "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "查找历史文件(cwd)" },
		},
	},
}
