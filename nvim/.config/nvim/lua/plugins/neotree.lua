return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>E",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = require("util").get_root() })
				end,
				desc = "浏览目录树 (root dir)",
				remap = true,
			},
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "浏览目录树 (cwd)",
				remap = true,
			},
			-- { "<leader>e", "<leader>fe", desc = "浏览目录树 (root dir)", remap = true },
			-- { "<leader>E", "<leader>fE", desc = "浏览目录树 (cwd)", remap = true },
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_empty = "󰜌",
					folder_empty_open = "󰜌",
				},
				git_status = {
					symbols = {
						renamed = "󰁕",
						unstaged = "󰄱",
					},
				},
			},
		},
		config = function(_, opts)
			require("neo-tree").setup(opts)
			vim.api.nvim_create_autocmd("TermClose", {
				pattern = "*lazygit",
				callback = function()
					if package.loaded["neo-tree.sources.git_status"] then
						require("neo-tree.sources.git_status").refresh()
					end
				end,
			})
		end,
	},
}
