return {
  -- add theme
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
    },
  },
}
