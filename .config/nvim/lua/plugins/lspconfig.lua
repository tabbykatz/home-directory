return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        prismals = {},
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { "<leader>cl", "<cmd>LspRestart<cr>", desc = "Lsp Restart" }
    end,
  },
}
