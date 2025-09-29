return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false }, -- turn off the built-in explorer
    },
    keys = {
      { "<leader>e", false }, -- remove Snacks' explorer keymap
    },
  },
}
