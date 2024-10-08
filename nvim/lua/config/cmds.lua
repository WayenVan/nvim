-- customised cmds
--
local function noice()
  return require("noice")
end

vim.api.nvim_create_user_command("VideScale", function()
  local factor = vim.fn.input("Enter the Scaler Factor")
  if factor ~= "" and factor ~= nil then
    factor = tonumber(factor)
    if factor then
      vim.g.neovide_scale_factor = factor
      noice().notify("Neovide Facotr Set to " .. tostring(factor), "info")
    else
      noice().notify("Invalid Factor", "error")
    end
  end
end, {})

vim.api.nvim_create_user_command("Http", function()
  local port = vim.fn.input("Enter the port", "8080")
  require("utils.term").create_terminal({
    cmd = "http-server" .. " -p" .. port,
  })
end, {})

-- vim.api.nvim_create_user_command("VennToggle", function()
--   require("utils.draw").Toggle_venn()
-- end, {})

vim.g.saved_eft = vim.o.errorformat
vim.g.saved_makeprg = vim.o.makeprg
vim.api.nvim_create_user_command("RestoreCompiler", function()
  vim.o.errorformat = vim.g.saved_eft
  vim.o.makeprg = vim.g.saved_makeprg
  require("noice").notify("Compiler Restored", "info")
end, {})
