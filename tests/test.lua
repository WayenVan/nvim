-- print(vim.fn.expand("%:e"))
require("overseer")
-- print(vim.inspect(LazyVim.lualine.pretty_path()))
--

print(require("nvim-navic").get_location())
local wb = require("winbar")
LazyVim.cmp.confirm()
