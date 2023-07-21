return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		build = (not jit.os:find("Windows"))
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},
	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				enabled = true,
				config = function()
					require("cmp").setup({
						sources = {
							{ name = "nvim_lsp" },
						},
					})

					local capabilities = require("cmp_nvim_lsp").default_capabilities()

					require("lspconfig").clangd.setup({
						capabilities = capabilities,
					})
				end,
			},
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				window = {
					documentation = false,
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
					}),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("config").icons.kinds
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
	},
	-- auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	-- surround
	-- {
	-- 	"echasnovski/mini.surround",
	-- 	keys = function(_, keys)
	-- 		-- Populate the keys based on the user's options
	-- 		local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
	-- 		local opts = require("lazy.core.plugin").values(plugin, "opts", false)
	-- 		local mappings = {
	-- 			{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
	-- 			{ opts.mappings.delete, desc = "Delete surrounding" },
	-- 			{ opts.mappings.find, desc = "Find right surrounding" },
	-- 			{ opts.mappings.find_left, desc = "Find left surrounding" },
	-- 			{ opts.mappings.highlight, desc = "Highlight surrounding" },
	-- 			{ opts.mappings.replace, desc = "Replace surrounding" },
	-- 			{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
	-- 		}
	-- 		mappings = vim.tbl_filter(function(m)
	-- 			return m[1] and #m[1] > 0
	-- 		end, mappings)
	-- 		return vim.list_extend(mappings, keys)
	-- 	end,
	-- 	opts = {
	-- 		mappings = {
	-- 			add = "gza", -- Add surrounding in Normal and Visual modes
	-- 			delete = "gzd", -- Delete surrounding
	-- 			find = "gzf", -- Find surrounding (to the right)
	-- 			find_left = "gzF", -- Find surrounding (to the left)
	-- 			highlight = "gzh", -- Highlight surrounding
	-- 			replace = "gzr", -- Replace surrounding
	-- 			update_n_lines = "gzn", -- Update `n_lines`
	-- 		},
	-- 	},
	-- },
	-- comments
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
}
