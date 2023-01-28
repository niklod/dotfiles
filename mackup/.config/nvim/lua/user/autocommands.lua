local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local general = augroup("General Settings", { clear = true })

-- Highlight when yanking
autocmd("TextYankPost", {
  callback = function()
    require("vim.highlight").on_yank { higroup = "Visual", timeout = 200 }
  end,
  group = general,
})

-- Run goimports after save
-- autocmd("BufWritePost", {
--     pattern = "*.go",
--     callback = function(event)
--         vim.cmd("silent !goimports -w -local=\"code.moba.live\" " .. event.match)
--     end
-- })

-- Auto Save
autocmd("BufModifiedSet", {
  callback = function()
    vim.cmd "silent! w"
  end,
  group = general,
})

-- Update file
autocmd("FocusGained", {
  callback = function()
    vim.cmd "checktime"
  end,
  group = general,
})

-- Automatically source vim file whenever you save it
autocmd("BufWritePost", {
  pattern = "*.vim",
  callback = function()
    vim.cmd "source <afile>"
  end,
  group = general,
})

-- Highlighting match words when searching
-- autocmd("ModeChanged", {
--   callback = function()
--     if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
--       vim.opt.hlsearch = false
--     else
--       vim.opt.hlsearch = true
--     end
--   end,
--   group = general,
-- })
