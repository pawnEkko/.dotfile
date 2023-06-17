-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

--keymap.set("模式", "改成什么按键", "原来什么按键")
keymap.set("i", "ii", "<Esc>") --将插入模式下的返回普通模式案件更改为i+i
