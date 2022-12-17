local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.numberwidth = 2

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 4
opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

opt.updatetime = 50

opt.ignorecase = true
opt.smartcase = true
opt.cursorline = false
opt.cursorcolumn = false
opt.backspace = 'indent,eol,start'
opt.showcmd = true
opt.autoread = true

opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append '-'
opt.fileencoding = 'utf-8'
opt.showmode = false
opt.timeoutlen = 1000
opt.cmdheight = 1
opt.virtualedit = 'block'
opt.list = true
opt.listchars = 'tab:→ ,leadmultispace:·,eol:↙'
opt.laststatus = 3
vim.o.ch = 1
