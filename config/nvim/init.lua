vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.scrolloff = 14 
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.guicursor = "n-v-c-i:block"

-- statusline
vim.o.statusline = "%f%m%=%y %B %l:%c %p%%"

-- colorscheme
vim.cmd.colorscheme("afterglow")
vim.cmd("highlight Normal guibg=NONE") 
vim.cmd("highlight NonText guibg=NONE")
vim.cmd("highlight LineNr guibg=NONE")
vim.cmd("highlight CursorLineNr guibg=NONE")

