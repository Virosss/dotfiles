local options = {
  backup = false,
  fileencoding = "utf-8",
  encoding = "utf-8",
  swapfile = false,
  clipboard = "unnamedplus",
  undofile = true,
  updatetime = 300,
  writebackup = false,
  relativenumber = true,
  tabstop = 2,
  title = true,
  autoindent = true,
  hlsearch = true,
  showcmd = true,
  cmdheight = 1,
  laststatus = 2,
  expandtab = true,
  scrolloff = 8,
  sidescrolloff = 8,
  backupskip = "/tmp/*,/private/tmp/*",
  inccommand = "split",
  ignorecase = true,
  smarttab = true,
  breakindent = true,
  shiftwidth = 2,
  ai = true,
  si = true,
  wrap = false,
  backspace = "start,eol,indent",
  cursorline = true,
  termguicolors = true,
  winblend = 0,
  wildoptions = 'pum',
  pumblend = 5,
  background = "dark"
}

-- General options
vim.scripttencoding = "utf-8"
vim.opt.shortmess:append "c"
vim.opt.path:append { "**" }
vim.opt.wildignore:append { "*/node_modules/*" }
vim.wo.number = true
vim.opt.formatoptions:append { "r" }

-- Load other options
for k, v in pairs(options) do
  vim.opt[k] = v
end
