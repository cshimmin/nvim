return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        chat = {
          keymaps = {
            close = { "<C-c>", "<C-k>" },
          },
        },
        actions_paths = { "~/.config/nvim/chatgpt-actions.json" },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
