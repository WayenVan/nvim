return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      --@type lspconfig.options
      servers = {
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          -- ---@type LazyKeysSpec[]
          -- keys = {},
          root_dir = function(fname)
            local util = require("lspconfig").util
            local root_parttern = {
              ".git/",
              ".neoconf.json",
              "package.json",
              "init.lua",
            }
            return util.root_pattern(unpack(root_parttern))(fname) or nil
          end,
        },
      },
    },
  },
}
