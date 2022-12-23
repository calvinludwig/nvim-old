vim.opt.guifont = 'JetbrainsMono Nerd Font'
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.numberwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.hidden = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.o.undofile = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.scrolloff = 4
vim.o.pumheight = 8
vim.wo.signcolumn = 'number'
vim.opt.isfname:append '@-@'
vim.o.updatetime = 50
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = false
vim.o.cursorcolumn = false
vim.o.backspace = 'indent,eol,start'
vim.o.showcmd = false
vim.o.autoread = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.iskeyword:append '-'
vim.o.fileencoding = 'utf-8'
vim.o.conceallevel = 0
vim.o.showmode = false
vim.o.timeoutlen = 500
vim.o.cmdheight = 1
vim.o.virtualedit = 'block'
vim.o.list = false
vim.o.listchars = 'tab:→ ,leadmultispace:·,eol:↙'
vim.o.laststatus = 3
vim.o.ch = 1
