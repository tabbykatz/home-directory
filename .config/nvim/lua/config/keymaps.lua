-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>m", "<cmd>!open -g -a Marked\\ 2.app '%:p'<cr>", { desc = "Preview in Marked" })
