require("config.options")
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.autocmds")
		require("config.keymaps")
	end,
})

-- 主题选择
-- 可供选择的主题：
-- gruvbox
-- catppuccin
-- tokyonight-night >>> tokyonight-moon >>> tokyonight-storm >>> tokyonight-day
-- everforest
vim.cmd([[colorscheme catppuccin]])
