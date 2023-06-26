return {
	 {
	 	"nvim-neo-tree/neo-tree.nvim",
	 	cmd = "Neotree",
	 	dependencies = {
	 		"nvim-lua/plenary.nvim",
	 		"nvim-tree/nvim-web-devicons",
	 		"MunifTanjim/nui.nvim",
	 	},
	 	keys = {
	 		{
	 			"<leader>e",
	 			function()
	 				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
	 			end,
	 			desc = "NeoTree",
	 		},
	 	},
	 },
}
