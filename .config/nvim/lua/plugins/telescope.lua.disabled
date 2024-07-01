local Util = require("lazyvim.util")
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- find
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },

      -- search
      { "<leader>/", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    },
  },
}
