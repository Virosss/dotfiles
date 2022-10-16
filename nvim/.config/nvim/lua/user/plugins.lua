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
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reload neovim when save plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Protect call that not show error on first start
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Packer Popup Settings
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Plugins
return packer.startup(function(use)
	-- Packer & depended plugins
	use "wbthomason/packer.nvim" -- Packer
	use "nvim-lua/popup.nvim" -- Support Popup API in NeoVim
	use "nvim-lua/plenary.nvim" -- Useful lua functions

  -- Themes
  use "sainnhe/sonokai" -- Sonokai Theme
  use 'bluz71/vim-nightfly-guicolors'
  -- Auto Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP 
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Buffers
  use "kyazdani42/nvim-web-devicons" -- nvim-web-devicons
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  -- Comments
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring" -- TS from Treesitter Plugin

  -- Autopairs
  use "windwp/nvim-autopairs"

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
