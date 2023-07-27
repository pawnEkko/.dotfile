local M = {}

function M.init()
	M.config()
	M.refresh(60, 5)
end

function M.config()
	-- 字体

	-- 按照个人配置
	-- 在 x11 --> i3wm下的 字体大小会小于 在 wayland --> hyprland 的字体
	-- 默认配置文件按照在 wayland --> hyprland 下的配置为默认配置
	-- vim.o.guifont = "Monaco:h11.5"
	-- vim.o.guifont = "JetBrainsMono:h12"
	vim.o.guifont = "Hack:h12.5"

	-- 没有空闲
	vim.g.neovide_no_idle = true
	-- 开启轨道动画
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

function M.background()
	-- 设置透明背景
	local alpha = function()
		return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 0.0
	vim.g.transparency = 0.7
	vim.g.neovide_background_color = "#0f1117" .. alpha()
end

-- 设置fps
function M.refresh(run_fps, free_fps)
	-- 设置刷新率
	vim.g.neovide_refresh_rate = run_fps
	-- 空闲刷新率
	vim.g.neovide_refresh_rate_idle = free_fps
end

return M
