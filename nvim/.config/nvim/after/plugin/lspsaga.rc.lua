local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
  return
end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript',
    php = 'php'
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<Cd>Lspsaga preview_definitions<cr>', opts)
vim.keymap.set('n', 'gr', '<Cd>Lspsaga rename<cr>', opts)
