local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.numberwidth = 2

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.cursorcolumn = false
opt.termguicolors = true
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.showcmd = true
opt.autoread = true
-- opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.fileencoding = "utf-8"
opt.showmode = false
opt.timeoutlen = 1000
opt.cmdheight = 1
opt.scrolloff = 8
opt.backup = false
opt.undofile = true
opt.virtualedit = "block"
opt.list = true
opt.listchars = "tab:→ ,leadmultispace:·,eol:↙"
opt.laststatus = 3
vim.o.ch = 1
