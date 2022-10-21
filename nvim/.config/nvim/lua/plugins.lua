local fn = vim.fn

-- Auto install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbbthomason/packer.nvim",
    install_path,
  }
  print "Installing Packer... close and re-open Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Auto reload neovim when save plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Protect from error if packer not exist
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Packer Settings
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
return packer.startup(function(use)
  -- Packer
  use "wbthomason/packer.nvim" -- Packer itself

  -- Common Utilities
  use 'nvim-lua/plenary.nvim'

  -- Solarized Dark Color Scheme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Web Dev Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status Line
  use 'hoob3rt/lualine.nvim'

  -- LSP
  use 'L3MON4D3/LuaSnip' -- Snippets
  use 'onsails/lspkind-nvim' -- VSCode like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for nvim LSP
  use 'hrsh7th/nvim-cmp' -- Auto Completion
  use 'glepnir/lspsaga.nvim' -- LSP UI
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Tree Sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Auto tagging & pairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Buffers
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }
  use 'norcalli/nvim-colorizer.lua'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Own Plugins
  use 'Virosss/neonotes.nvim'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
