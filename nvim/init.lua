if vim.g.vscode then
  require("mvscode")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
  -- add new cmds
  require("config.cmds")
  -- auto run
  require("config.autorun")
end