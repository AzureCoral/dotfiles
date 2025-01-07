local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use { 'catppuccin/nvim', as = "catppuccin" }
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use
  {
    "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end
  }
  use
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use {
    'nvim-lua/lsp-status.nvim',
    requires = { 'neovim/nvim-lspconfig' }
  }
  
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use {
    'jose-elias-alvarez/null-ls.nvim'
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'

  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin_config.alpha-nvim')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
