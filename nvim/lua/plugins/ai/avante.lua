local function get_build_command()
  local os_name, _ = require("utils.os_name").get_os_name()
  if os_name == "Windows" then
    return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  else
    return "make"
  end
end

local build_command = get_build_command()
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "copilot",
      -- add any opts here
      windows = {
        width = 35,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    },
    build = build_command,
    config = function(_, opts)
      require("avante_lib").load()
      require("avante").setup(opts)

      -- setup auto command for avante buffer
      vim.api.nvim_create_augroup("Avante_", { clear = true })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = "Avante_",
        pattern = { "Avante", "AvanteInput" },
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          vim.api.nvim_buf_set_keymap(buf, "n", "q", "<CMD>AvanteToggle<CR>", { noremap = true, silent = true })
        end,
      })

      --automatic refresh
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        group = "Avante_",
        callback = function()
          local pattern = { "Avante", "AvanteInput" }
          if not vim.tbl_contains(pattern, vim.bo.filetype) then
            return
          end
          vim.cmd("AvanteRefresh")
          -- print("refreshed")
        end,
      })
    end,

    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "Avante" },
        },
        ft = { "Avante" },
      },
    },
  },
}
