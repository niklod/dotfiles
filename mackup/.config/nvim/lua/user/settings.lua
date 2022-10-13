local v = vim.api

vim.cmd("colorscheme onedark")

vim.opt.guifont = 'SFMono Nerd Font'
vim.opt.relativenumber = true
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.encoding = 'utf-8'
vim.opt.pumheight = 10
vim.opt.fileencoding = 'utf-8'
vim.opt.ruler = true
vim.opt.cmdheight = 0
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel =0
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.laststatus = 2
vim.opt.cursorline = false
vim.opt.background = 'dark'
vim.opt.showtabline = 1
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 3000
vim.opt.timeoutlen = 250
vim.opt.ttimeoutlen = 20
vim.opt.clipboard = 'unnamedplus'
vim.opt.incsearch = false
vim.opt.ignorecase = false
vim.opt.smartcase = true
vim.opt.scrolloff = 2
vim.opt.showmode = false
vim.opt.termguicolors = true -- enable 24bit colors
vim.opt.undofile = true
vim.opt.wrap = false -- don't wrap text around when the window is too small
vim.diagnostic.config({
  virtual_text = false,
})
