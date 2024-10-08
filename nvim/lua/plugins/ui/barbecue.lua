return {
  {
    "utilyre/barbecue.nvim",
    event = "LazyFile",
    enabled = false,
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
      exclude_filetypes = { "netrw", "toggleterm", "neo-tree", "AvanteInput", "Avante" },
    },
  },
}
