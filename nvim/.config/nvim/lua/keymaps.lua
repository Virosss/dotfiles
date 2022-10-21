local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text UP/DOWN
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)

-- Increment/Decrement
keymap("n", "=", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete a word backwords
keymap('n', 'dw', 'vb"_d', opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
