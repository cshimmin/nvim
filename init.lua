-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "i", "c" }, "jk", "<Esc>")

vim.keymap.set("n", "<Leader>ws", "<C-W>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<Leader>wv", "<C-W>v", { desc = "Split window vertically" })
--vim.keymap.set("n", "<Leader>l", "<C-W>l", { desc = "Window right" })
--vim.keymap.set("n", "<Leader>h", "<C-W>h", { desc = "Window left" })
--vim.keymap.set("n", "<Leader>k", "<C-W>k", { desc = "Window up" })
--vim.keymap.set("n", "<Leader>j", "<C-W>j", { desc = "Window down" })
vim.keymap.set("n", "<Leader>wh", "<C-W>h", { desc = "Window left" })
vim.keymap.set("n", "<Leader>wl", "<C-W>l", { desc = "Window right" })
vim.keymap.set("n", "<Leader>wk", "<C-W>k", { desc = "Window up" })
vim.keymap.set("n", "<Leader>wj", "<C-W>j", { desc = "Window down" })

vim.keymap.set("n", "<Leader>wT", "<C-W>T", { desc = "Break out into new tab" })

vim.keymap.set("n", "<Leader>L", "<cmd>Lazy<cr>")
--vim.keymap.set("n", "<Leader>LL", "<C-W>v", { desc = "Split window vertically" })
--vim.keymap.set("n", "<Leader>h", ":")
