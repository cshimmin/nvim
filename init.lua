-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

function find_dotfile_in_parents()
  -- Define the dotfile name
  local dotfile = ".no-black"

  -- Starting directory (directory of the current buffer)
  local dir = vim.fn.expand("%:p:h")

  -- Keep track of the filesystem root to avoid infinite loops
  local fs_root = vim.fn.fnamemodify(dir, ":p:h")

  while true do
    -- Check if the dotfile exists in the current directory
    if vim.fn.filereadable(dir .. "/" .. dotfile) == 1 then
      -- Enable Black
      vim.g.black_enabled = 0
      return
    end

    -- Check if we have reached the filesystem root
    if dir == fs_root then
      -- Disable Black
      vim.g.black_enabled = 1
      return
    end

    -- Move up one directory
    dir = vim.fn.fnamemodify(dir, ":h")
  end
end

-- Call the function when opening a buffer and after changing directories
vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
  pattern = "*",
  callback = find_dotfile_in_parents,
})

-- disable lsp logging (otherwise file grows quickly)
vim.lsp.set_log_level("off")

-- more readable window borders
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.mouse = ""

-- unset this annoying thing
--vim.api.nvim_del_keymap("i", "<A-j>")
--vim.api.nvim_del_keymap("i", "<A-k>")

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

-- tell it which python to use?
vim.g.python3_host_prog = "python3"
