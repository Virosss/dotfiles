local options = {
  backup = false,
  clipboard = "unnamedplus",
  hlsearch = true,
  fileencoding = "utf-8",
  smartindent = true,
  swapfile = false,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,
  guifont = "monospace:h20",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end
