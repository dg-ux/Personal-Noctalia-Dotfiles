return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("matugen").setup()
      end,
    },
  },
}