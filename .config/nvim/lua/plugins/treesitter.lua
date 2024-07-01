return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prisma",
        "sql",
      })
    end,
  },
}
