local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true
opt.cursorcolumn = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- bakcspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
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

-- opt.list = true
-- opt.listchars = "tab: ,trail:·,extends:◣,precedes:◢,nbsp:○,eol:↵"

vim.o.ch = 0
