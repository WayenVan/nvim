return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      border = "solid",
      transparency = 20,
      doc_lines = 0,
      handler_opts = {
        border = "solid",
      },
      hint_enable = false,
      hint_prefix = {
        above = "↙ ", -- when the hint is on the line above the current line
        current = "← ", -- when the hint is on the same line
        below = "↖ ", -- when the hint is on the line below the current line
      },
      hi_parameter = "OrangeBold",
    },
    keys = {
      {
        "<c-g>",
        function()
          require("lsp_signature").toggle_float_win()
        end,
        mode = "i",
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
      LazyVim.lsp.on_attach(function(client, buffer)
        require("lsp_signature").on_attach({}, buffer)
      end)
    end,
  },
}
